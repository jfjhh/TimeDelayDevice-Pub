/*******************************************************************************
 * Time Delay Device Arduino Control
 * Edgar Perez and Alex Striff
 * Reed College Physics Department
 *
 * For more information, contact Lucas Illing <illing@reed.edu>.
 *
 * Version  Date        Author       Changes
 * -------  ----------  -----------  -----------------------------------------------
 * v1.0     2016-12-15  Edgar Perez  Prototype completed.
 * v2.0     2019-07-XX  Alex Striff  Modified for publication board.
 *
 ********************************************************************************/

// Code options (feature selection)
#define DEBUG // Uncomment for serial debug output
#define SCREEN // Uncomment to enable screen output

#ifdef SCREEN
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "lato24.h"

extern TwoWire Wire1; // Use second I2C pins on the Due

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels
#define OLED_RESET    -1 // Reset pin # (or -1 if sharing Arduino reset pin)
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire1, OLED_RESET);
boolean screen = true;
boolean draw   = true;
char s_digits[16];

enum menu_mode {
    MENU = 0, // Main menu
    DELAY,    // Adjust the word count using the rotary encoder
    FIFO,     // Show FIFO status
    HELP,     // Show on-line help
    ABOUT,    // About the device
    FOO,
    BAR,
    BAZ,
    QUUX,
    A,
    B,
    C,
    D,
    MENU_MODES,
} menu_mode = DELAY;
const char menu_names[][16] = {
    "Menu",
    "Delay",
    "FIFO",
    "Help",
    "About",
    "Foo",
    "Bar",
    "Baz",
    "Quux",
    "A",
    "B",
    "C",
    "D",
};
uint32_t menu_pos = MENU + 1;
int menu_press = 0;

int dpress = 0;
long dpress_delay = 250L;
long dpress_time = 0L;

#endif // SCREEN

typedef const uint8_t pin;

typedef struct {
    pin p;                      // The pin that the button is connected to.
    long debounce_delay;        // The delay (ms) for debouncing a button press.
    int state;                  // The current state of the button.
    int last_state;             // The last state of the button.
    long last_debounce_time;    // The last debounce time for the button.
} button;

typedef struct {
    pin a;          // Output A
    pin b;          // Output B
    button btn;     // Button (knob of encoder)
} rotary_encoder;

// FIFO word limits
const uint32_t min_words = 3;
const uint32_t max_words = 262144;

// Rotary encoder pin mapping
rotary_encoder enc = {
    .a   = 51,
    .b   = 48,
    .btn = {
        .p = 46,
        .debounce_delay = 50,
        .state = 0,
        .last_state = 0,
        .last_debounce_time = 0
    }
};

uint32_t words = 10; // This variable will be changed by (initial) encoder input
uint32_t words_digit = 0;

int32_t  count_min = min_words;
int32_t  count_max = max_words;
int32_t  count_mul = 1000;

// FIFO pin mapping
pin RT    = 53;
pin OE    = 52;
pin REN   = 50;
pin OR    = 49;
pin PAE   = 47;
pin HF    = 40;
pin PAF   = 39;
pin FWFT  = 37;
pin IR    = 36;
pin LD    = 34;
pin MRS   = 35;
pin PRS   = 32;
pin WEN   = 31;
pin SEN   = 30;
pin WLSTN = 29;
pin WCLK  = 28;

// DAC pin mapping
pin DAC_LDAC = 26;
pin DAC_CS   = 24;

// Clock enabling (for DAC setup)
pin CLK_EN = 23; // C'est le Bodge Nouveau

// Serial command buffer
#define SBLEN  16
char sb[SBLEN];


void setup(void)
{
    // Serial communication
    Serial.begin(9600);
    Serial.print(
        "===================\n"
        " Time Delay Device \n"
        "===================\n"
        "Type 'h' for help.\n"
        "Setting up I/O ... ");

    // DAC initialization
    delay(10);
    digitalWrite(CLK_EN, LOW);
    digitalWrite(DAC_LDAC, HIGH);
    delay(5);
    digitalWrite(CLK_EN, HIGH);
    digitalWrite(DAC_LDAC, LOW);

    // FIFO pins
    pinMode(REN,   INPUT);
    pinMode(OR,    INPUT_PULLUP);
    pinMode(PAE,   INPUT_PULLUP);
    pinMode(HF,    INPUT_PULLUP);
    pinMode(PAF,   INPUT_PULLUP);
    pinMode(IR,    INPUT_PULLUP);
    pinMode(OE,    OUTPUT);
    pinMode(RT,    OUTPUT);
    pinMode(FWFT,  OUTPUT);
    pinMode(LD,    OUTPUT);
    pinMode(MRS,   OUTPUT);
    pinMode(PRS,   OUTPUT);
    pinMode(WCLK,  OUTPUT);
    pinMode(WEN,   OUTPUT);
    pinMode(SEN,   OUTPUT);
    pinMode(WLSTN, OUTPUT);

    // FIFO default states
    digitalWrite(MRS,   HIGH);
    digitalWrite(PRS,   HIGH);
    digitalWrite(RT,    HIGH);
    digitalWrite(FWFT,  HIGH);
    digitalWrite(LD,    HIGH);
    digitalWrite(WEN,   HIGH);
    digitalWrite(REN,   HIGH);
    digitalWrite(SEN,   HIGH);
    digitalWrite(OE,    LOW);
    digitalWrite(WCLK,  LOW);
    digitalWrite(WLSTN, LOW);

    // DAC pins
    delay(100);
    pinMode(CLK_EN,   OUTPUT);
    pinMode(DAC_LDAC, OUTPUT);
    pinMode(DAC_CS,   OUTPUT);

    // More DAC initialization
    delay(10);
    pinMode(DAC_CS,   OUTPUT);
    digitalWrite(DAC_CS, HIGH);
    delay(5);
    digitalWrite(DAC_CS, LOW);
    delay(5);
    digitalWrite(DAC_CS, HIGH);
    delay(5);
    digitalWrite(DAC_CS, LOW);
    delay(10);

    // Rotary encoder pins
    pinMode(enc.btn.p, INPUT_PULLUP);
    pinMode(enc.a,     INPUT_PULLUP);
    pinMode(enc.b,     INPUT_PULLUP);
    
    // Screen initialization
    #ifdef SCREEN
    if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3C for 128x32
        Serial.println(F("SSD1306 allocation failed. Unable to use screen."));
        screen = false;
    } else {
        screen = true;
        display.clearDisplay();
        display.cp437(true);
        display.setTextColor(WHITE);
        display.setTextSize(1);
        display.setCursor(0, 0);
        display.print("Time Delay Device vP2");
        display.setCursor(0, 8);
        display.print("Reed College Physics");
        display.setCursor(0, 24);
        display.print("2-press knob for menu");
        display.display();

        for (uint8_t i = 0; i < SCREEN_WIDTH; i++) {
            display.drawPixel(i, 16 + (i*i / 7) % 8, WHITE);
            display.display();
        }
    }
    #endif // SCREEN

    // Do a master reset to initialize the FIFO
    Serial.print(" complete. Initializing FIFO:\n\t");
    delay(5);
    master_reset();
    Serial.println();
}


void loop(void)
{
    unsigned long narg;

    for (int i = 0; i < SBLEN; i++)
        sb[i] = '\0';

    if (Serial.available() > 0) {
        Serial.readBytesUntil('*', sb, SBLEN);
        
        narg = atol(sb + 1);
        switch (sb[0]) {
            case 'h': // Fallthrough.
            case 'H': // Fallthrough.
            case '?': serial_help(); break;
            case 'm':
                if(sb[1] == 'r')
                    master_reset();
                else
                    unknown();
                break;
            case 'p':
                if(sb[1] == 'r')
                    partial_reset();
                else
                    unknown();
                break;
            case 'd': set_delay(narg); break;
            case 's': report_status(); break;
            case 'x': pause(narg); break;
            case 'i': initialize(); break;
            case 'q': quit(); break;
            default:
                unknown();
                
        }
    }

    #ifdef SCREEN
    if (screen) {
        switch (menu_mode) {
            case MENU:
                menu_pos = enc_adjust_nodigit(&menu_pos, MENU + 1, MENU_MODES - 1, true);
                if (draw) {
                    display.clearDisplay();
                    display.setFont();
                    for (size_t i = MENU + 1; i < MENU_MODES; i++) {
                        int16_t x = 8 + ((i - 1) / 4) * SCREEN_WIDTH / ((MENU_MODES - 1) / 4);
                        int16_t y = ((i - 1) % 4) * 8;
                        display.setCursor(x, y);
                        display.print(menu_names[i]);
                    }

                    int16_t alt = ((menu_pos - 1) / 4) * SCREEN_WIDTH / ((MENU_MODES - 1) / 4);
                    int16_t mid = 2 + ((menu_pos - 1) % 4) * 8;
                    display.fillTriangle(alt, mid - 2, alt, mid + 2, alt + 3, mid, WHITE);
                    display.display();
                    draw = false;
                }

                if (read_button(&enc.btn)) {
                    menu_press = 1;
                } else if (menu_press == 1) { // button was pressed and now it is not
                    menu_mode = (enum menu_mode) menu_pos;
                    menu_press = 0;
                    draw = true;
                }
                
                break;
              
            case DELAY:
                { // Surrounding block to disambiguate scope
                    set_delay(enc_adjust(&words, &words_digit, count_min, count_max, false));
                    if (draw) {
                        sprintf(s_digits, "%06u", words);
                        display.clearDisplay();
                        display.setFont(&Lato_Regular_24);
                        display.setCursor(0,24);
                        display.print(s_digits);
                        int16_t mid = 6 + (6 - words_digit - 1) * 15;
                        int16_t base = 31;
                        display.fillTriangle(mid - 3, base, mid + 3, base, mid, base - 4, WHITE);
                        display.display();
                        draw = false;
                    }
                }
                break;

            case HELP:
                Serial.println("Help");
                break;
                
            default:
                Serial.println("Menu error!");
                break;
        }

        // Double-press detection
        if (menu_mode != MENU) {
            int press = read_button(&(enc.btn));
            int quick = millis() - dpress_time <= dpress_delay;
            if ((dpress == 0 && press)
                || (dpress == 1 && !press && quick)
                || (dpress == 2 && press && quick)) {
                dpress_time = millis();
                dpress++;
            } else if (dpress == 3 && !press && quick) {
                dpress = 0;
                menu_mode = menu_mode != MENU ? MENU : DELAY;
                draw = true;
            } else if (!quick) {
                dpress = 0;
            }
        }
    }
    #endif // SCREEN
}


void unknown(void)
{
    Serial.println("Unknown Command. Type 'h' for help.");
    serial_help();
}


void serial_help(void)
{
    Serial.print(
            "Time Delay Device Serial Commands\n"
            "=================================\n"
            "mr\tPerforms a master reset of FIFO memory.\n"
            "pr\tPerforms a partial reset of FIFO memory.\n"
            "d N\tSets delay to N words, where N is a decimal number between ");
    Serial.print(min_words, DEC);
    Serial.print(" and ");
    Serial.print(max_words, DEC);
    Serial.print(
            ".\n"
            "\tE.g.: 'D3' and 'D100' produce delays of 3 and 100 words, respectively.\n"
            "\tValues outside this range will be clamped, so 'D0' is the same as 'D3'.\n"
            "\t<time delay> = <delay words> * <clock period>.\n"
            "s\tReports FIFO status.\n"
            "x N\tPauses for N seconds (neglecting serial delays; not precise).\n"
            "i\tInitializes the program.\n"
            "q\tQuits the program.\n"
            "h H ?\tShows this help.\n"
            "\n"
            );
}


void partial_reset(void)
{
    long t1, t2;
    Serial.print("Partial Reset ... ");
    t1 = micros();
    digitalWrite(WLSTN, HIGH);
    delay(1);
    
    digitalWrite(REN, HIGH);
    digitalWrite(WEN, HIGH);
    digitalWrite(RT,  HIGH);
    delayMicroseconds(3);
    digitalWrite(PRS, LOW);
    delayMicroseconds(3);
    digitalWrite(PRS, HIGH);
    delayMicroseconds(3);
    digitalWrite(WEN, LOW);
    digitalWrite(WLSTN, LOW);
    
    t2 = micros() - t1;
    delayMicroseconds(1);
    Serial.print("done (");
    Serial.print(t2);
    Serial.println(" us).");
}


void master_reset(void)
{
    long t1, t2;
    Serial.print("Master Reset ... ");
    t1 = micros();
    digitalWrite(FWFT, HIGH);
    digitalWrite(LD,   HIGH);
    digitalWrite(MRS,  LOW);
    delayMicroseconds(1);
    digitalWrite(MRS, HIGH);
    
    t2 = micros() - t1;
    delayMicroseconds(1);
    Serial.print("done (");
    Serial.print(t2);
    Serial.println(" us).");
    Serial.print("Device in FWFT with Serial Loading.\n");
}


void report_status(void)
{
    Serial.print(
        "FIFO Status\n"
        "===========\n");
    Serial.print("~IR\t");  Serial.println(digitalRead(IR));
    Serial.print("~OR\t");  Serial.println(digitalRead(OR));
    Serial.print("~PAF\t"); Serial.println(digitalRead(PAF));
    Serial.print("~PAE\t"); Serial.println(digitalRead(PAE));
    Serial.print("~HF\t");  Serial.println(digitalRead(HF));
    Serial.println();

    // DEBUGGING
    Serial.println(words_digit);
    Serial.println(words);
    Serial.println(ipow(3, 0));
    Serial.println(ipow(3, 1));
    Serial.println(ipow(3, 5));
}


void pause(unsigned int n)
{
    for (int i = 0; i < n; i++) {
        Serial.println(n - i);
        delay(1000);
    }
    Serial.println("0.");
}


void set_delay(unsigned int n)
{
    unsigned int m;
    int bits;
    
    n = clamp(n, min_words, max_words);
    if (n == words) return;
    words = n;
    m = max_words - n;
    
    Serial.print("Sending a "); Serial.print(n); Serial.print(" word delay ... ");
    digitalWrite(WLSTN, 1);
    delayMicroseconds(10);

    digitalWrite(WCLK, 0);
    digitalWrite(LD, 0);
    digitalWrite(SEN, 0);
    delayMicroseconds(2);

    // The following number is defined because PAF triggers at the given
    // number of words AWAY FROM the end, not AT the given word like PAE.
    for (int i = 0; i < 36 ; i++) {
        bits = i == 0 ? 1 : bitRead(m, i - 18);
        digitalWrite(FWFT, bits);
        delayMicroseconds(1);
        digitalWrite(WCLK, 1);
        delayMicroseconds(1);
        digitalWrite(WCLK, 0);
    }

    digitalWrite(LD, 1);
    digitalWrite(SEN, 1);
    digitalWrite(WLSTN, 0);
    Serial.print("done. Resetting: ");
    partial_reset();
}


void initialize(void)
{
    digitalWrite(WEN, 0);
    digitalWrite(REN, 0);
    Serial.println("Initiated program.");
}


void quit(void)
{
    digitalWrite(WEN, 1);
    digitalWrite(REN, 1);
    Serial.println("Quit program.");
}


int read_encoder(rotary_encoder *e)
{
    static int8_t enc_states[4][4] = {
        { 0, -1,  1,  0},
        { 1,  0,  0, -1},
        {-1,  0,  0,  1},
        { 0,  1, -1,  0}
    };
    static uint8_t old_AB = 0;
    int8_t direction;
    uint8_t AB = digitalRead(e->a) << 1 | digitalRead(e->b);

    direction = enc_states[old_AB][AB];
    old_AB = AB;

    return direction;
}


int32_t clamp(int32_t x, int32_t min, int32_t max)
{
    return x <= min ? min : x >= max ? max : x;
}


int ipow(int base, unsigned int exp)
{
    int result = 1;
    
    for (; exp; base *= base, exp >>= 1)
        if (exp & 1)
            result *= base;

    return result;
}


uint32_t enc_adjust(uint32_t *n, uint32_t *digit, uint32_t n_min, uint32_t n_max, boolean reverse)
{
    int     direction;
    int32_t count = *n;
    direction = read_encoder(&enc) * (reverse ? -1 : 1);

    if (direction) {
        if (read_button(&(enc.btn))) {
            *digit = clamp(*digit + direction, 0, 5);
            #ifdef DEBUG
            Serial.print("Button press: ");
            Serial.println(*digit);
            #endif // DEBUG
        } else {
            count = clamp(count + direction * ipow(10, *digit), n_min, n_max);
            #ifdef DEBUG
            Serial.print("Count: ");
            Serial.println(count);
            #endif // DEBUG
        }
        #ifdef SCREEN
        draw = true;
        dpress = 0;
        #endif // SCREEN
    }

    return (uint32_t) count;
}


uint32_t enc_adjust_nodigit(uint32_t *n, uint32_t n_min, uint32_t n_max, boolean reverse)
{
    int     direction;
    int32_t count = *n;
    direction = read_encoder(&enc) * (reverse ? -1 : 1);

    if (direction) {
        count = clamp(count + direction, n_min, n_max);
        #ifdef DEBUG
        Serial.print("ND Count: ");
        Serial.println(count);
        #endif // DEBUG
        #ifdef SCREEN
        draw = true;
        dpress = 0;
        #endif // SCREEN
    }

    return (uint32_t) count;
}


int read_button(button *button)
{
    int reading = digitalRead(button->p);
    
    if (reading != button->last_state)
        button->last_debounce_time = millis();
    if (millis() - button->last_debounce_time > button->debounce_delay)
        button->state = reading;
    
    return button->last_state = reading;
}
