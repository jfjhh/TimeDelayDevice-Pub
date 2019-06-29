/*//////////////////////////////////////////////////////////////////////////////
TIME DELAY DEVICE ARDUINO CONTROL
WRITTEN BY EDGAR PEREZ
REED COLLEGE
12-15-2016
---------
Supported Serial Commands:

MR - Master Reset of FIFO Memory
PR - Partial Reset of FIFO Memory
DXXXXXX - Delay signal by XXXXXX words where XXXXXX is a number between 3-262144
	  Ex: D3, D100, and D123456 produce delays of 3, 100, and 123456
	  words*clockspeed
---------

Note: by pressing down the rotary encoder's push button, the encoder takes steps
of 500 words instead of a single word.

FOR MORE INFORMATION CONTACT LUCAS ILLING AT illing@reed.edu

//////////////////////////////////////////////////////////////////////////////*/

// SCREEN LIBRARIES
// #include <Wire.h>
// #include <Adafruit_RGBLCDShield.h>
// #include <utility/Adafruit_MCP23017.h>

// The screen uses the I2C SCL and SDA pins.
// Adafruit_RGBLCDShield lcd = Adafruit_RGBLCDShield();

// These #defines make it easy to set the backlight color
#define RED 0x1
#define YELLOW 0x3
#define GREEN 0x2
#define TEAL 0x6
#define BLUE 0x4
#define VIOLET 0x5
#define WHITE 0x7
char toprow[16];
int cursloc;

// ROTARY SWITCH PIN MAPPING
#define ENC_A 68
#define ENC_B 69
#define ENC_PORT
static uint32_t counter = 10; // This variable will be changed by encoder input

// CLOCK ENABLING (FOR DAC SET-UP)
const int CLK_EN = 7;

// BUTTON PIN MAPPING & CONSTANTS
const int buttonpin = A11;
int buttonState = 0;
int lastButtonState = 0;
long lastDebounceTime = 0;
long debounceDelay = 10;

// BUTTON2 PIN MAPPING & CONSTANTS
const int button2pin = A10;
int button2State = 0;
int lastButton2State = 0;
long lastDebounce2Time = 0;
long debounce2Delay = 50;

// BUTTON3 PIN MAPPING & CONSTANTS
const int button3pin = A9;
int button3State = 0;
int lastButton3State = 0;
long lastDebounce3Time = 0;
long debounce3Delay = 50;
int LSbutton3;

// LIVEROTOR CONSTANTS
long rotorvalp = 0;

// FIFO PIN MAPPING
// NOTE: OE AND RT WERE SWITCHED.
const int OE = 23;
const int RT = 22;
const int REN = 24;
const int RCLK = 25;
const int RM = 26;
const int OR = 27;
const int PFM = 28;
const int PAE = 29;
const int IP = 31;
const int BE = 32;
const int FSEL1 = 33;
const int HF = 34;
const int FSEL0 = 35;
const int OW = 36;
const int PAF = 37;
const int IR = 38;
const int FWFTSI=39;
const int LD = 40;
const int MRS = 41;
const int PRS = 42;
// note the reassignment of the wclk and rlstn pin numbers. This was done make
// make the board routing possible.
// RLSTN was not being used anyway.
const int WCLK = 46;
const int WEN = 45;
const int SEN = 44;
const int WLSTN = 47;
const int RLSTN = 43;

// ADC PIN MAPPINGmm
const int ADC_LDAC = 3;
const int ADC_CS = 4;
const int ADC_WR = 50;//  Not in use.

// FIFO CONSTANT MAPPING
int PAF_flag;

// SETTING UP SERIAL BUFFER
#define SBLEN 8
#define SBBLEN 9
char sb[SBLEN];
byte sbb[SBBLEN];

void setup() {
	// SETTING UP LDAC BOOT
	pinMode(CLK_EN, OUTPUT);
	pinMode(ADC_LDAC, OUTPUT);
	digitalWrite(CLK_EN, LOW);
	digitalWrite(ADC_LDAC,HIGH);
	delay(5);
	digitalWrite(CLK_EN,HIGH);
	digitalWrite(ADC_LDAC,LOW);

	// SETTING COMMUNICATION
	Serial.begin(115200);

	// SETTING ROTARY SWITCH
	pinMode(buttonpin, INPUT_PULLUP);
	pinMode(ENC_A, INPUT_PULLUP);
	digitalWrite(ENC_A, HIGH);
	pinMode(ENC_B, INPUT_PULLUP);
	digitalWrite(ENC_B, HIGH);

	// SETTING LCD
	// lcd.begin(16, 2);
	// lcd.setBacklight(WHITE);
	// lcd.print("Hello, world!2");

	// SETTING UP BUTTON2
	pinMode(button2pin, INPUT_PULLUP);

	// SETTING UP BUTTON3
	pinMode(button3pin, INPUT_PULLUP);

	// SETTING UP DAC PINS
	pinMode(ADC_WR, INPUT_PULLUP);
	pinMode(ADC_CS, OUTPUT);

	// SETTING UP PINS
	pinMode(OE, OUTPUT);
	pinMode(RT, OUTPUT);
	pinMode(REN, INPUT);
	pinMode(RCLK, OUTPUT);
	pinMode(RM, OUTPUT);
	pinMode(OR, INPUT_PULLUP);
	pinMode(PFM, OUTPUT);
	pinMode(PAE, INPUT_PULLUP);

	pinMode(IP, OUTPUT);
	pinMode(BE, OUTPUT);
	pinMode(FSEL1, OUTPUT);
	pinMode(HF, INPUT_PULLUP);
	pinMode(FSEL0, OUTPUT);
	pinMode(OW, OUTPUT);
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
	pinMode(RLSTN, OUTPUT);

	// SETTING UP DEFAULT STATES
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
	digitalWrite(RCLK, LOW);
	digitalWrite(WLSTN, LOW);
	digitalWrite(RLSTN, LOW);

	digitalWrite(RM, HIGH);
	digitalWrite(IP, LOW);

	// digitalWrite(ADC_WR, LOW);
	digitalWrite(ADC_CS, HIGH);
	delay(5);
	digitalWrite(ADC_CS, LOW);
	delay(5);
	digitalWrite(ADC_CS, HIGH);
	delay(5);
	digitalWrite(ADC_CS, LOW);

	// STARTING THINGS WITH A MASTER RESET TO INITIALIZE THE FIFO
	delay(5);
	Master_Reset();
	Serial.println("Start");
}


void loop() {
	// rotary();
	/*if(button2()){
	  Delay(rotary());
	  delay(500);
	  }
	 */
	/*if(button3() != LSbutton3){
	  Initialize();
	  LSbutton3 = button3();
	  }
	  else{
	  Quit();
	  }
	 */

	LiveRotor();

	if(Serial.available()>0){
		Serial.readBytesUntil('*',sbb,SBBLEN);
		for(int i=1; i<9; i++){
			sb[i-1] = sbb[i];
		}
		unsigned long val = atol(sb);
		unsigned long val2 = 262144-val;
		int cont = sbb[0];
		// sbclear();

		switch (cont){
			case 'c':
				Serial.print("You requested ");
				Serial.print(val);
				Serial.println(" clocks");
				sbclear();
				break;

			case 'M':
				if(sb[0] == 'R'){
					Master_Reset();
				}
				else{
					Invalid();
				}
				break;

			case 'P':
				if(sb[0] == 'R'){
					Partial_Reset();
				}
				else{
					Invalid();
				}
				break;

			case 'W':
				Write(val);
				break;

			case 'R':
				Read(val);
				break;

			case 's':
				Report_Status();
				break;

			case 'd':
				Pause(val);
				break;

			case 'D':
				Delay(val);
				break;

			case 'I':
				Initialize();
				break;

			case 'Q':
				Quit();
				break;

			default:
				Invalid();

		}

		sbbclear();
	}
}

void sbshift(){
	sb[0]=sb[0]-48;
	for(int i=SBLEN - 1; i>0; i--){
		sb[i] = sb[i-1];
	}
}

void sbclear(){
	for(int i=0; i<7; i++){
		sb[i]=0;
	}
}


void sbbclear(){
	for(int i=0; i<7; i++){
		sbb[i]=0;
	}
}

void Partial_Reset(){
	Serial.print("You have initiated a Partial Reset...");
	long tym1 = micros();
	digitalWrite(WLSTN, 1);
	delay(1);
	digitalWrite(REN, 1);
	digitalWrite(WEN, 1);
	digitalWrite(RT, 1);
	// digitalWrite(SEN, 1); //why this one though?
	delayMicroseconds(3);
	digitalWrite(PRS,LOW);
	delayMicroseconds(3);
	digitalWrite(PRS,HIGH);
	delayMicroseconds(3);
	digitalWrite(WEN, 0);
	digitalWrite(WLSTN, 0);
	long tym2 = micros() - tym1;
	Serial.print("Completed in "); Serial.print(tym2); Serial.println(" us");
}

void Master_Reset(){
	Serial.print("You have initiated a Master Reset...");
	long tym1 = micros();
	// digitalWrite(REN, 1);
	digitalWrite(FWFTSI,HIGH);
	digitalWrite(LD, HIGH);
	digitalWrite(MRS, LOW);
	delayMicroseconds(1);
	digitalWrite(MRS,HIGH);
	long tym2 = micros()-tym1;
	delayMicroseconds(1);
	Serial.print("Completed in "); Serial.print(tym2); Serial.println(" us. Device in FWFT with Serial Loading");
}

void Invalid(){
	Serial.println("Unknown Command");
}

void LSTN(){
	digitalWrite(WLSTN, 0);
	// digitalWrite(RLSTN, 0);
}

void UNLSTN(){
	digitalWrite(WLSTN, 1);
	// digitalWrite(RLSTN, 1);
}

void Write(unsigned n){
	Serial.print("You requested "); Serial.print(n); Serial.println(" writes");
	// LSTN();
	digitalWrite(WEN, LOW);
	for(unsigned i = 0; i < n; i++){
		digitalWrite(WCLK, HIGH);
		digitalWrite(RCLK, HIGH);
		digitalWrite(WCLK, LOW);
		digitalWrite(RCLK, LOW);
		// Serial.println(i);
	}
	digitalWrite(WEN, HIGH);
	// UNLSTN();
	Serial.println("done");
}

void Read(unsigned n){
	Serial.print("You requested "); Serial.print(n); Serial.println(" reads");
	LSTN();
	if(sb[0] == 0){
		for (int i = 0; i<3; i++){
			digitalWrite(RCLK, HIGH);
			digitalWrite(RCLK, LOW);
		}
		Serial.print("RCLK"); Serial.println("3");
	}
	else{
		digitalWrite(OE,1);
		digitalWrite(OE,0);
		digitalWrite(REN, LOW);
		Serial.println("REN LOW");
		for (unsigned i = 0; i < n; i++){
			digitalWrite(RCLK, HIGH);
			digitalWrite(RCLK,LOW);
		}
		Serial.println("done");
		digitalWrite(REN, HIGH);
		Serial.println("REN HIGH");
	}
	UNLSTN();
}

void Report_Status(){
	Serial.println("Status report requested");
	{
		int IRval = digitalRead(IR);
		int ORval = digitalRead(OR);
		int PAFval = digitalRead(PAF);
		int PAEval = digitalRead(PAE);
		int HFval = digitalRead(HF);
		Serial.print("IR  "); Serial.println(IRval);
		Serial.print("OR  "); Serial.println(ORval);
		Serial.print("PAF "); Serial.println(PAFval);
		Serial.print("PAE "); Serial.println(PAEval);
		Serial.print("HF  "); Serial.println(HFval);
	}
}

void Pause(unsigned n){
	for(int i = 0; i<n; i++){
		Serial.println(n-i);
		delay(1000);
	}
	Serial.println(0);
}


void Delay(unsigned int n){
	counter = n;
	unsigned int n2 = 262144 - n;

	Serial.println("You requested a "); Serial.print(n); Serial.println(" word delay. Initiating");
	digitalWrite(WLSTN, 1);// //////////
	delayMicroseconds(10);

	digitalWrite(WCLK, 0);
	digitalWrite(LD, 0);
	digitalWrite(SEN, 0);
	// digitalWrite(WEN, 1);
	// digitalWrite(REN, 1);

	delayMicroseconds(2);
	// The following number is defined because PAF triggers at the given number of words AWAY FROM the end, not AT the given word like PAE

	for(int i = 0; i<36 ; i++){
		int Bit = bitRead(n2,i-18);

		if(i==0) Bit=1;
		digitalWrite(FWFTSI, Bit);
		delayMicroseconds(1);
		digitalWrite(WCLK, 1);
		delayMicroseconds(1);
		digitalWrite(WCLK, 0);
		Serial.print(Bit);

	}
	digitalWrite(LD, 1);
	digitalWrite(SEN,1);
	// digitalWrite(WEN, wenstate);
	// digitalWrite(REN, renstate);

	digitalWrite(WLSTN, 0);
	Partial_Reset();
	Serial.println(" "); Serial.println("done");


	/*sprintf(toprow,"DldWrds = %06u",n);
	  lcd.home();
	  lcd.clear();
	  lcd.print(toprow);*/

}

void Initialize(){
	digitalWrite(WEN, 0);
	digitalWrite(REN,0);
	Serial.println("Initiating program");
}

void Quit(){
	digitalWrite(WEN, 1);
	digitalWrite(REN, 1);
	Serial.println("Quitting Program");
}

int8_t read_encoder()
{
	static int8_t enc_states[] = {0, -1, 1, 0, 1, 0, 0, -1, -1, 0, 0, 1, 0, 1, -1, 0};
	static uint8_t old_AB = 0;
	unsigned long help = PIOA -> PIO_PDSR;

	old_AB <<= 2; // remember previous state
	// Serial.println(help ,BIN);
	old_AB |= ( help & 0x03 );  // add current state
	// Serial.println(old_AB ,BIN);
	return ( enc_states[( old_AB & 0x0f )]);
}



uint32_t rotary(){
	{
		int8_t tmpdata;
		// Serial.println("encoder read requested");
		tmpdata = read_encoder();


		if ( !button() && tmpdata ) {
			counter += tmpdata;
			Serial.print("Counter value: ");
			Serial.println(counter, DEC);
		}
		if ( button () && tmpdata ) {
			counter += 500*tmpdata;
			Serial.print("Counter value: ");
			Serial.println(counter, DEC);
		}
		return ( counter );
	}
}

void LiveRotor(){
	uint32_t rotorvalc = rotary();
	if(rotorvalc != rotorvalp){
		Delay(rotorvalc);
	}
	rotorvalp = rotorvalc;
}

int button ()
{
	int reading = digitalRead(buttonpin);
	if (reading != lastButtonState){
		lastDebounceTime = millis ();
	}

	if ((millis() - lastDebounceTime)> debounceDelay){
		if (reading !=  buttonState) {
			buttonState = reading;

		}
		return(buttonState);
		/*if (buttonState == 1){
		  Serial.println("button");
		  }
		 */
	}
	lastButtonState = reading;
}

int button2 ()
{
	int reading = digitalRead(button2pin);
	if (reading != lastButton2State){
		lastDebounce2Time = millis ();
	}

	if ((millis() - lastDebounce2Time)> debounce2Delay){
		if (reading !=  button2State) {
			button2State = reading;

		}
		return(button2State);
		/*if (buttonState == 1){
		  Serial.println("button");
		  }
		 */
	}
	lastButton2State = reading;
}

int button3 ()
{
	int reading = digitalRead(button3pin);
	if (reading != lastButton3State){
		lastDebounce3Time = millis ();
	}

	if ((millis() - lastDebounce3Time)> debounce3Delay){
		if (reading !=  button3State) {
			button3State = reading;

		}
		return(button3State);
		/*if (buttonState == 1){
		  Serial.println("button");
		  }
		 */
	}
	lastButton3State = reading;
}

