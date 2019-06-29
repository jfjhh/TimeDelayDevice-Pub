/*******************************************************************************
 * Time Delay Device Arduino Control
 * Edgar Perez and Alex Striff
 * Reed College Physics Department
 *
 * For more information, contact Lucas Illing <illing@reed.edu>.
 *
 * Version  Date        Author       Changes
 * -------  ----------  -----------  -----------------------------------------------
 * v1.0.0   2016-12-15  Edgar Perez  Prototype completed.
 * v1.0.1   2019-06-XX  Alex Striff  Modified for publication board.
 *
 * Notes
 * =====
 * By pressing down the rotary encoder's push button, the encoder takes steps
 * of 1000 words instead of a single word (set by the `count_mul` variable).
 *
 ********************************************************************************/

// Uncomment to enable LCD output.
// #define LCD

#ifdef LCD
#include <Wire.h>
#include <Adafruit_RGBLCDShield.h>
#include <utility/Adafruit_MCP23017.h>

#define RED     0x1 << 0
#define GREEN   0x1 << 1
#define BLUE    0x1 << 2
#define YELLOW  RED   | GREEN
#define TEAL    GREEN | BLUE
#define VIOLET  RED   | BLUE
#define WHITE   RED   | GREEN | BLUE

// The LCD uses the I2C SCL and SDA pins.
Adafruit_RGBLCDShield lcd = Adafruit_RGBLCDShield();
char toprow[16];
int cursloc;
#endif // LCD

typedef const uint8_t pin;

typedef struct {
    pin p;                      // The pin that the button is connected to.
    long debounce_delay;        // The delay for debouncing a button press.
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
    .a   = 25,
    .b   = 26,
    .btn = {
        .p = 28,
        .debounce_delay = 10,
        .state = 0,
        .last_state = 0,
        .last_debounce_time = 0
    }
};

uint32_t words   = 10; // This variable will be changed by (initial) encoder input
int32_t  count_min = min_words;
int32_t  count_max = max_words;
int32_t  count_mul = 1000;

// Clock enabling (for DAC setup)
pin CLK_EN = 7;

// FIFO pin mapping
pin OE     = 22;
pin RT     = 23;
pin REN    = 24;
pin OR     = 27;
pin PAE    = 29;
pin HF     = 34;
pin PAF    = 37;
pin IR     = 38;
pin FWFTSI = 39;
pin LD     = 40;
pin MRS    = 41;
pin PRS    = 42;
pin WCLK   = 46;
pin WEN    = 45;
pin SEN    = 44;
pin WLSTN  = 47;

// ADC pin mapping
pin DAC_LDAC = 3;
pin DAC_CS   = 4;

// FIFO constant mapping
int PAF_flag;

// Serial buffers
#define SBLEN   8
#define SBBLEN  9
char sb[SBLEN];
char sbb[SBBLEN];


void setup(void)
{
    // Serial communication
    Serial.begin(115200);
    Serial.println("===================");
    Serial.println(" Time Delay Device ");
    Serial.println("===================");
    Serial.println("Type 'h' for help.");
    Serial.print("Setting up I/O ... ");

    // FIFO pins
    pinMode(OE, OUTPUT);
    pinMode(RT, OUTPUT);
    pinMode(REN, INPUT);
    pinMode(OR, INPUT_PULLUP);
    pinMode(PAE, INPUT_PULLUP);
    pinMode(HF, INPUT_PULLUP);
    pinMode(PAF, INPUT_PULLUP);
    pinMode(IR, INPUT_PULLUP);
    pinMode(FWFTSI, OUTPUT);
    pinMode(LD, OUTPUT);
    pinMode(MRS, OUTPUT);
    pinMode(PRS, OUTPUT);
    pinMode(WCLK, OUTPUT);
    pinMode(WEN, OUTPUT);
    pinMode(SEN, OUTPUT);
    pinMode(WLSTN, OUTPUT);

    // FIFO default states
    digitalWrite(MRS, HIGH);
    digitalWrite(PRS, HIGH);
    digitalWrite(RT, HIGH);
    digitalWrite(FWFTSI, HIGH);
    digitalWrite(LD, HIGH);
    digitalWrite(WEN, HIGH);
    digitalWrite(REN, HIGH);
    digitalWrite(SEN, HIGH);
    digitalWrite(OE, LOW);
    digitalWrite(WCLK, LOW);
    digitalWrite(WLSTN, LOW);

    // DAC pins and boot
    pinMode(DAC_CS, OUTPUT);
    pinMode(CLK_EN, OUTPUT);
    pinMode(DAC_LDAC, OUTPUT);
    digitalWrite(CLK_EN, LOW);
    digitalWrite(DAC_LDAC,HIGH);
    delay(5);
    digitalWrite(CLK_EN,HIGH);
    digitalWrite(DAC_LDAC,LOW);

    digitalWrite(DAC_CS, HIGH);
    delay(5);
    digitalWrite(DAC_CS, LOW);
    delay(5);
    digitalWrite(DAC_CS, HIGH);
    delay(5);
    digitalWrite(DAC_CS, LOW);

    // Rotary encoder
    pinMode(enc.btn.p, INPUT_PULLUP);
    pinMode(enc.a, INPUT_PULLUP);
    digitalWrite(enc.a, HIGH);
    pinMode(enc.b, INPUT_PULLUP);
    digitalWrite(enc.b, HIGH);

    #ifdef LCD
    // LCD
    lcd.begin(16, 2);
    lcd.setBacklight(WHITE);
    lcd.print("Hello, world!2");
    #endif // LCD

    // Do a master reset to initialize the FIFO
    Serial.print(" complete. Initializing FIFO:\n\t");
    delay(5);
    master_reset();
    Serial.println();
}


void loop(void)
{
    unsigned long narg;

    live_rotor();

    if (Serial.available() > 0) {
        Serial.readBytesUntil('*', sbb, SBBLEN);
        for (int i = 1; i < SBBLEN; i++) {
            sb[i-1] = sbb[i];
        }

        narg = atol(sb);
        switch (sbb[0]) {
            case 'h': // Fallthrough.
            case 'H': // Fallthrough.
            case '?': serial_help(); break;
            case 'm':
                if(sb[0] == 'r')
                    master_reset();
                else
                    unknown();
                break;
            case 'p':
                if(sb[0] == 'r')
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

        sbbclear();
    }
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
            "x N\tPauses for N seconds.\n"
            "i\tInitializes the program.\n"
            "q\tQuits the program.\n"
            "h H ?\tShows this help.\n"
            "\n"
            );
}


void sbshift(void)
{
    sb[0] -= 48;
    for (int i = SBLEN - 1; i > 0; i--)
        sb[i] = sb[i-1];
}


void sbclear(void)
{
    for(int i = 0; i < SBLEN; i++)
        sb[i] = 0;
}


void sbbclear(void)
{
    for(int i = 0; i < SBBLEN; i++)
        sbb[i] = 0;
}


void partial_reset(void)
{
    long t1, t2;
    Serial.print("Partial Reset ... ");
    t1 = micros();
    digitalWrite(WLSTN, 1);
    delay(1);
    digitalWrite(REN, 1);
    digitalWrite(WEN, 1);
    digitalWrite(RT, 1);
    delayMicroseconds(3);
    digitalWrite(PRS,LOW);
    delayMicroseconds(3);
    digitalWrite(PRS,HIGH);
    delayMicroseconds(3);
    digitalWrite(WEN, 0);
    digitalWrite(WLSTN, 0);
    t2 = micros() - t1;
    Serial.print("done (");
    Serial.print(t2);
    Serial.print(" us).\n");
}


void master_reset(void)
{
    long t1, t2;
    Serial.print("Master Reset ... ");
    t1 = micros();
    digitalWrite(FWFTSI, HIGH);
    digitalWrite(LD, HIGH);
    digitalWrite(MRS, LOW);
    delayMicroseconds(1);
    digitalWrite(MRS,HIGH);
    t2 = micros() - t1;
    delayMicroseconds(1);
    Serial.print("done (");
    Serial.print(t2);
    Serial.println(" us).");
    Serial.print("Device in FWFT with Serial Loading.\n");
}


void report_status(void)
{
    Serial.println("FIFO Status");
    Serial.println("===========");
    Serial.print("IR\t"); Serial.println(digitalRead(IR));
    Serial.print("OR\t"); Serial.println(digitalRead(OR));
    Serial.print("PAF\t"); Serial.println(digitalRead(PAF));
    Serial.print("PAE\t"); Serial.println(digitalRead(PAE));
    Serial.print("HF\t"); Serial.println(digitalRead(HF));
    Serial.println();
}


void pause(unsigned int n)
{
    for(int i = 0; i < n; i++) {
        Serial.println(n - i);
        delay(1000);
    }
    Serial.println(0);
}


void set_delay(unsigned int n)
{
    unsigned int m;
    int bits;
    
    n = clamp(n, min_words, max_words);
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
        digitalWrite(FWFTSI, bits);
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

    #ifdef LCD
    sprintf(toprow, "D.Words = %06u", n);
    lcd.home();
    lcd.clear();
    lcd.print(toprow);
    #endif // LCD
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


int8_t read_encoder(rotary_encoder *e)
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
    return x <= min ? count_min : x >= max ? max : x;
}


uint32_t rotary(void)
{
    int8_t  tmpdata;
    int32_t mul;
    int32_t count = words;
    tmpdata = read_encoder(&enc);

    if (tmpdata) {
        mul = read_button(&(enc.btn)) ? count_mul : 1;
        count += mul * tmpdata;
        count = clamp(count, count_min, count_max);
    }

    return (uint32_t) count;
}


void live_rotor(void)
{
    uint32_t rotorvalc = rotary();
    
    if (rotorvalc != words) {
        set_delay(rotorvalc);
    }
}


int read_button(button *button)
{
    int reading = digitalRead(button->p);
    if (reading != button->last_state){
        button->last_debounce_time = millis();
    }

    if (millis() - button->last_debounce_time > button->debounce_delay) {
        if (reading != button->state) {
            button->state = reading;
        }
        return button->state;
    } else {
        button->last_state = reading;
    }
}
