EESchema Schematic File Version 4
LIBS:FIFO_P-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Time Delay Circuit (Low Speed)"
Date "2019-01-30"
Rev ""
Comp "Reed College"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FIFO_P:LTC1740 U3
U 1 1 592106E2
P 2100 2850
F 0 "U3" H 2750 1000 60  0000 C CNN
F 1 "LTC1740" H 2750 2950 60  0000 C CNN
F 2 "FIFO_P:SSOP-36_5.3mm_Pitch0.65mm" H 2700 2050 60  0001 C CNN
F 3 "" H 2700 2050 60  0000 C CNN
	1    2100 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 59211740
P 750 2400
F 0 "R2" V 830 2400 50  0000 C CNN
F 1 "51R" V 750 2400 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 680 2400 50  0001 C CNN
F 3 "" H 750 2400 50  0000 C CNN
	1    750  2400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 59211A5D
P 1000 2250
F 0 "R4" V 1080 2250 50  0000 C CNN
F 1 "0R" V 1000 2250 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 930 2250 50  0001 C CNN
F 3 "" H 1000 2250 50  0000 C CNN
	1    1000 2250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 59211E98
P 1950 2350
F 0 "C1" H 1960 2420 50  0000 L CNN
F 1 "560pF" H 1650 2250 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1950 2350 50  0001 C CNN
F 3 "" H 1950 2350 50  0000 C CNN
	1    1950 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5921226A
P 750 3050
F 0 "R3" V 830 3050 50  0000 C CNN
F 1 "51R" V 750 3050 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 680 3050 50  0001 C CNN
F 3 "" H 750 3050 50  0000 C CNN
	1    750  3050
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 59212272
P 1000 2900
F 0 "R5" V 1080 2900 50  0000 C CNN
F 1 "0R" V 1000 2900 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 930 2900 50  0001 C CNN
F 3 "" H 1000 2900 50  0000 C CNN
	1    1000 2900
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 59212C90
P 1500 3000
F 0 "C2" H 1510 3070 50  0000 L CNN
F 1 "1uF" H 1510 2920 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1500 3000 50  0001 C CNN
F 3 "" H 1500 3000 50  0000 C CNN
	1    1500 3000
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR01
U 1 1 59212EC6
P 450 3200
F 0 "#PWR01" H 450 2950 50  0001 C CNN
F 1 "GNDA" H 450 3050 50  0000 C CNN
F 2 "" H 450 3200 50  0000 C CNN
F 3 "" H 450 3200 50  0000 C CNN
	1    450  3200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR02
U 1 1 59212F06
P 400 2550
F 0 "#PWR02" H 400 2300 50  0001 C CNN
F 1 "GNDA" H 500 2600 50  0000 C CNN
F 2 "" H 400 2550 50  0000 C CNN
F 3 "" H 400 2550 50  0000 C CNN
	1    400  2550
	1    0    0    -1  
$EndComp
Text GLabel 1550 3950 0    60   Input ~ 0
+5V
$Comp
L power:GNDA #PWR03
U 1 1 592131A7
P 1650 3650
F 0 "#PWR03" H 1650 3400 50  0001 C CNN
F 1 "GNDA" H 1650 3500 50  0000 C CNN
F 2 "" H 1650 3650 50  0000 C CNN
F 3 "" H 1650 3650 50  0000 C CNN
	1    1650 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5921314D
P 1650 3550
F 0 "C4" H 1660 3620 50  0000 L CNN
F 1 "1uF" H 1660 3470 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1650 3550 50  0001 C CNN
F 3 "" H 1650 3550 50  0000 C CNN
	1    1650 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 59213E06
P 1800 3800
F 0 "C6" H 1810 3870 50  0000 L CNN
F 1 "1uF" H 1810 3720 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 1800 3800 50  0001 C CNN
F 3 "" H 1800 3800 50  0000 C CNN
	1    1800 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 592140C8
P 3450 3450
F 0 "C11" H 3460 3520 50  0000 L CNN
F 1 "1uF" H 3460 3370 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3450 3450 50  0001 C CNN
F 3 "" H 3450 3450 50  0000 C CNN
	1    3450 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 592142A5
P 3550 3150
F 0 "C10" H 3560 3220 50  0000 L CNN
F 1 "1uF" H 3560 3070 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 3550 3150 50  0001 C CNN
F 3 "" H 3550 3150 50  0000 C CNN
	1    3550 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 59214DE0
P 3100 2350
F 0 "D1" H 3100 2450 50  0000 C CNN
F 1 "LED_RED" H 3100 2250 50  0000 C CNN
F 2 "LEDs:LED_D3.0mm" H 3100 2350 50  0001 C CNN
F 3 "" H 3100 2350 50  0000 C CNN
	1    3100 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 59214EEE
P 2750 2350
F 0 "R6" V 2830 2350 50  0000 C CNN
F 1 "10R" V 2750 2350 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 2680 2350 50  0001 C CNN
F 3 "" H 2750 2350 50  0000 C CNN
	1    2750 2350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C9
U 1 1 59216E26
P 2700 4950
F 0 "C9" H 2710 5020 50  0000 L CNN
F 1 "1uF" H 2710 4870 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2700 4950 50  0001 C CNN
F 3 "" H 2700 4950 50  0000 C CNN
	1    2700 4950
	1    0    0    -1  
$EndComp
NoConn ~ 3350 3750
Text GLabel 4050 3550 1    60   Input ~ 0
3.3V
Text GLabel 3150 5050 1    60   Input ~ 0
3.3V
$Comp
L power:GND #PWR04
U 1 1 5921BBA1
P 6000 5550
F 0 "#PWR04" H 6000 5300 50  0001 C CNN
F 1 "GND" H 6000 5400 50  0000 C CNN
F 2 "" H 6000 5550 50  0000 C CNN
F 3 "" H 6000 5550 50  0000 C CNN
	1    6000 5550
	1    0    0    -1  
$EndComp
NoConn ~ 5800 5250
NoConn ~ 5900 5250
NoConn ~ 6100 5250
NoConn ~ 6200 5250
$Comp
L FIFO_P:AD7840 U10
U 1 1 5921D257
P 9550 3750
F 0 "U10" H 10050 2500 60  0000 C CNN
F 1 "AD7840" H 10050 3900 60  0000 C CNN
F 2 "Housings_SSOP:SSOP-24_5.3x8.2mm_Pitch0.65mm" H 9550 3750 60  0001 C CNN
F 3 "" H 9550 3750 60  0000 C CNN
	1    9550 3750
	1    0    0    -1  
$EndComp
Text GLabel 6300 5550 3    60   Input ~ 0
3.3V
$Comp
L power:GND #PWR05
U 1 1 5921ED44
P 9550 4850
F 0 "#PWR05" H 9550 4600 50  0001 C CNN
F 1 "GND" H 9550 4700 50  0000 C CNN
F 2 "" H 9550 4850 50  0000 C CNN
F 3 "" H 9550 4850 50  0000 C CNN
	1    9550 4850
	-1   0    0    -1  
$EndComp
Text GLabel 10550 4350 2    60   Input ~ 0
+5V
Text GLabel 10950 4050 2    60   Input ~ 0
-5V
Text GLabel 5850 2400 1    60   Input ~ 0
3.3V
NoConn ~ 6450 1900
Text GLabel 1400 6650 0    60   Input ~ 0
CLK
Text GLabel 2450 6650 3    60   Input ~ 0
RCLK
Text GLabel 1650 6450 0    60   Input ~ 0
LDAC
Text GLabel 2825 6350 2    60   Input ~ 0
3.3V
$Comp
L power:GND #PWR06
U 1 1 5926EE96
P 2825 6650
F 0 "#PWR06" H 2825 6400 50  0001 C CNN
F 1 "GND" H 2825 6500 50  0000 C CNN
F 2 "" H 2825 6650 50  0000 C CNN
F 3 "" H 2825 6650 50  0000 C CNN
	1    2825 6650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C8
U 1 1 5926EE9E
P 2825 6500
F 0 "C8" H 2850 6600 50  0000 L CNN
F 1 "1uF" H 2850 6400 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2863 6350 50  0001 C CNN
F 3 "" H 2825 6500 50  0000 C CNN
	1    2825 6500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5926EEA9
P 2600 6500
F 0 "C5" H 2625 6600 50  0000 L CNN
F 1 "100nF" H 2625 6400 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2638 6350 50  0001 C CNN
F 3 "" H 2600 6500 50  0000 C CNN
	1    2600 6500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5926EEB9
P 1250 6050
F 0 "#PWR07" H 1250 5800 50  0001 C CNN
F 1 "GND" H 1250 5900 50  0000 C CNN
F 2 "" H 1250 6050 50  0000 C CNN
F 3 "" H 1250 6050 50  0000 C CNN
	1    1250 6050
	-1   0    0    1   
$EndComp
Text GLabel 2400 7550 2    60   Input ~ 0
WCLK
Text GLabel 2850 7050 2    60   Input ~ 0
3.3V
Text GLabel 2400 7450 2    60   Input ~ 0
WLSTN
Text GLabel 1600 7250 0    60   Input ~ 0
CLK
Text GLabel 1600 7350 0    60   Input ~ 0
WCLK_S
$Comp
L Device:C C3
U 1 1 5926F3F1
P 2500 7200
F 0 "C3" H 2525 7300 50  0000 L CNN
F 1 "100nF" H 2525 7100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2538 7050 50  0001 C CNN
F 3 "" H 2500 7200 50  0000 C CNN
	1    2500 7200
	-1   0    0    1   
$EndComp
$Comp
L FIFO_P:SN74LVC2G157_MUX_TI U1
U 1 1 5926F3F8
P 2000 7400
F 0 "U1" H 2000 7150 60  0000 C CNN
F 1 "SN74LVC2G157_MUX_TI" H 1650 7700 60  0000 C CNN
F 2 "Housings_SSOP:SSOP-8_2.95x2.8mm_Pitch0.65mm" H 2000 7100 60  0001 C CNN
F 3 "" H 2000 7100 60  0000 C CNN
	1    2000 7400
	1    0    0    -1  
$EndComp
NoConn ~ 1600 7450
$Comp
L power:GND #PWR08
U 1 1 5926F401
P 2850 7350
F 0 "#PWR08" H 2850 7100 50  0001 C CNN
F 1 "GND" H 2850 7200 50  0000 C CNN
F 2 "" H 2850 7350 50  0000 C CNN
F 3 "" H 2850 7350 50  0000 C CNN
	1    2850 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5926F409
P 2750 7200
F 0 "C7" H 2775 7300 50  0000 L CNN
F 1 "1uF" H 2775 7100 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 2788 7050 50  0001 C CNN
F 3 "" H 2750 7200 50  0000 C CNN
	1    2750 7200
	-1   0    0    1   
$EndComp
Text GLabel 4950 1900 3    60   Input ~ 0
WLSTN
NoConn ~ 4550 1900
Text GLabel 4650 1900 3    60   Input ~ 0
WCLK_S
NoConn ~ 5650 1900
NoConn ~ 5750 1900
NoConn ~ 5950 1900
NoConn ~ 6050 1900
NoConn ~ 6150 1900
NoConn ~ 6250 1900
NoConn ~ 6650 1900
NoConn ~ 6750 1900
Text GLabel 6150 2950 1    60   Input ~ 0
RCLK
Text GLabel 4950 2950 1    60   Input ~ 0
WCLK
$Comp
L Device:C_Small C13
U 1 1 592760A0
P 4350 3650
F 0 "C13" H 4360 3720 50  0000 L CNN
F 1 "10uF" H 4360 3570 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4350 3650 50  0001 C CNN
F 3 "" H 4350 3650 50  0000 C CNN
	1    4350 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5927613B
P 4200 3650
F 0 "C12" H 4210 3720 50  0000 L CNN
F 1 ".1uF" H 4210 3570 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 4200 3650 50  0001 C CNN
F 3 "" H 4200 3650 50  0000 C CNN
	1    4200 3650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 59276D19
P 5700 5550
F 0 "#PWR09" H 5700 5300 50  0001 C CNN
F 1 "GND" H 5700 5400 50  0000 C CNN
F 2 "" H 5700 5550 50  0000 C CNN
F 3 "" H 5700 5550 50  0000 C CNN
	1    5700 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 59279234
P 6150 5500
F 0 "C17" H 6160 5570 50  0000 L CNN
F 1 "10uF" H 6160 5420 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6150 5500 50  0001 C CNN
F 3 "" H 6150 5500 50  0000 C CNN
	1    6150 5500
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5927923A
P 6150 5350
F 0 "C16" H 6160 5420 50  0000 L CNN
F 1 ".1uF" H 6160 5270 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6150 5350 50  0001 C CNN
F 3 "" H 6150 5350 50  0000 C CNN
	1    6150 5350
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5927ADCC
P 7000 4250
F 0 "#PWR010" H 7000 4000 50  0001 C CNN
F 1 "GND" H 7000 4100 50  0000 C CNN
F 2 "" H 7000 4250 50  0000 C CNN
F 3 "" H 7000 4250 50  0000 C CNN
	1    7000 4250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5927AE4C
P 7000 3550
F 0 "#PWR011" H 7000 3300 50  0001 C CNN
F 1 "GND" H 7000 3400 50  0000 C CNN
F 2 "" H 7000 3550 50  0000 C CNN
F 3 "" H 7000 3550 50  0000 C CNN
	1    7000 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5927D117
P 5600 2650
F 0 "C15" H 5610 2720 50  0000 L CNN
F 1 "10uF" H 5610 2570 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 5600 2650 50  0001 C CNN
F 3 "" H 5600 2650 50  0000 C CNN
	1    5600 2650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5927D11D
P 5600 2500
F 0 "C14" H 5610 2570 50  0000 L CNN
F 1 ".1uF" H 5610 2420 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 5600 2500 50  0001 C CNN
F 3 "" H 5600 2500 50  0000 C CNN
	1    5600 2500
	0    1    -1   0   
$EndComp
$Comp
L Device:C_Small C19
U 1 1 5928C320
P 6500 3700
F 0 "C19" H 6510 3770 50  0000 L CNN
F 1 "10uF" H 6510 3620 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 6500 3700 50  0001 C CNN
F 3 "" H 6500 3700 50  0000 C CNN
	1    6500 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5928C326
P 6350 3700
F 0 "C18" H 6360 3770 50  0000 L CNN
F 1 ".1uF" H 6360 3620 50  0000 L CNN
F 2 "Capacitors_ThroughHole:C_Rect_L4.0mm_W2.5mm_P2.50mm" H 6350 3700 50  0001 C CNN
F 3 "" H 6350 3700 50  0000 C CNN
	1    6350 3700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 592A366B
P 2100 3750
F 0 "#PWR012" H 2100 3500 50  0001 C CNN
F 1 "GND" H 2100 3600 50  0000 C CNN
F 2 "" H 2100 3750 50  0000 C CNN
F 3 "" H 2100 3750 50  0000 C CNN
	1    2100 3750
	0    1    1    0   
$EndComp
Text GLabel 3900 3550 1    60   Input ~ 0
-5V
Text GLabel 1400 6550 0    60   Input ~ 0
CLK_ADC
Text GLabel 3350 2950 2    60   Input ~ 0
CLK_ADC
$Comp
L power:GND #PWR013
U 1 1 592AAB76
P 2600 2500
F 0 "#PWR013" H 2600 2250 50  0001 C CNN
F 1 "GND" H 2600 2350 50  0000 C CNN
F 2 "" H 2600 2500 50  0000 C CNN
F 3 "" H 2600 2500 50  0000 C CNN
	1    2600 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 592B2CF6
P 7000 4850
F 0 "#PWR014" H 7000 4600 50  0001 C CNN
F 1 "GND" H 7000 4700 50  0000 C CNN
F 2 "" H 7000 4850 50  0000 C CNN
F 3 "" H 7000 4850 50  0000 C CNN
	1    7000 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 592B2DEE
P 5450 2400
F 0 "#PWR015" H 5450 2150 50  0001 C CNN
F 1 "GND" H 5450 2250 50  0000 C CNN
F 2 "" H 5450 2400 50  0000 C CNN
F 3 "" H 5450 2400 50  0000 C CNN
	1    5450 2400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 592B5456
P 1600 7550
F 0 "#PWR016" H 1600 7300 50  0001 C CNN
F 1 "GND" H 1600 7400 50  0000 C CNN
F 2 "" H 1600 7550 50  0000 C CNN
F 3 "" H 1600 7550 50  0000 C CNN
	1    1600 7550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 592BC666
P 3750 3650
F 0 "#PWR017" H 3750 3400 50  0001 C CNN
F 1 "GND" H 3750 3500 50  0000 C CNN
F 2 "" H 3750 3650 50  0000 C CNN
F 3 "" H 3750 3650 50  0000 C CNN
	1    3750 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 592C2159
P 2450 4850
F 0 "#PWR018" H 2450 4600 50  0001 C CNN
F 1 "GND" H 2450 4700 50  0000 C CNN
F 2 "" H 2450 4850 50  0000 C CNN
F 3 "" H 2450 4850 50  0000 C CNN
	1    2450 4850
	1    0    0    -1  
$EndComp
Text GLabel 7350 3850 2    60   Input ~ 0
3.3V
$Comp
L power:GND #PWR019
U 1 1 592D1CAD
P 4400 1900
F 0 "#PWR019" H 4400 1650 50  0001 C CNN
F 1 "GND" H 4400 1750 50  0000 C CNN
F 2 "" H 4400 1900 50  0000 C CNN
F 3 "" H 4400 1900 50  0000 C CNN
	1    4400 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR020
U 1 1 592DE142
P 1300 3000
F 0 "#PWR020" H 1300 2750 50  0001 C CNN
F 1 "GNDA" H 1300 2850 50  0000 C CNN
F 2 "" H 1300 3000 50  0000 C CNN
F 3 "" H 1300 3000 50  0000 C CNN
	1    1300 3000
	-1   0    0    1   
$EndComp
$Comp
L power:GNDA #PWR021
U 1 1 592DF259
P 3750 3050
F 0 "#PWR021" H 3750 2800 50  0001 C CNN
F 1 "GNDA" H 3750 2900 50  0000 C CNN
F 2 "" H 3750 3050 50  0000 C CNN
F 3 "" H 3750 3050 50  0000 C CNN
	1    3750 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR022
U 1 1 592DF304
P 3750 3350
F 0 "#PWR022" H 3750 3100 50  0001 C CNN
F 1 "GNDA" H 3750 3200 50  0000 C CNN
F 2 "" H 3750 3350 50  0000 C CNN
F 3 "" H 3750 3350 50  0000 C CNN
	1    3750 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5926EEBF
P 1400 6200
F 0 "R1" V 1480 6200 50  0000 C CNN
F 1 "50R" V 1400 6200 50  0000 C CNN
F 2 "Resistors_ThroughHole:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1330 6200 50  0001 C CNN
F 3 "" H 1400 6200 50  0000 C CNN
	1    1400 6200
	-1   0    0    1   
$EndComp
$Comp
L power:GNDA #PWR023
U 1 1 592CE7B5
P 1950 3150
F 0 "#PWR023" H 1950 2900 50  0001 C CNN
F 1 "GNDA" H 1950 3000 50  0000 C CNN
F 2 "" H 1950 3150 50  0000 C CNN
F 3 "" H 1950 3150 50  0000 C CNN
	1    1950 3150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 592DEA1F
P 2150 1000
F 0 "#PWR024" H 2150 750 50  0001 C CNN
F 1 "GND" H 2150 850 50  0000 C CNN
F 2 "" H 2150 1000 50  0000 C CNN
F 3 "" H 2150 1000 50  0000 C CNN
	1    2150 1000
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR025
U 1 1 592DEAA9
P 2750 1000
F 0 "#PWR025" H 2750 750 50  0001 C CNN
F 1 "GNDA" H 2750 850 50  0000 C CNN
F 2 "" H 2750 1000 50  0000 C CNN
F 3 "" H 2750 1000 50  0000 C CNN
	1    2750 1000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 592DEB87
P 2150 1400
F 0 "#PWR026" H 2150 1150 50  0001 C CNN
F 1 "GND" H 2150 1250 50  0000 C CNN
F 2 "" H 2150 1400 50  0000 C CNN
F 3 "" H 2150 1400 50  0000 C CNN
	1    2150 1400
	0    1    1    0   
$EndComp
$Comp
L power:GNDA #PWR027
U 1 1 592DEB8D
P 2750 1400
F 0 "#PWR027" H 2750 1150 50  0001 C CNN
F 1 "GNDA" H 2750 1250 50  0000 C CNN
F 2 "" H 2750 1400 50  0000 C CNN
F 3 "" H 2750 1400 50  0000 C CNN
	1    2750 1400
	0    -1   -1   0   
$EndComp
Text GLabel 3950 2900 1    60   Input ~ 0
+5V
$Comp
L FIFO_P:TXB0104 U6
U 1 1 5C4F2685
P 8500 4150
F 0 "U6" H 8500 3750 60  0000 C CNN
F 1 "TXB0104" H 8500 4550 60  0000 C CNN
F 2 "" H 8500 4200 60  0000 C CNN
F 3 "" H 8500 4200 60  0000 C CNN
	1    8500 4150
	1    0    0    -1  
$EndComp
Text GLabel 8050 3750 1    60   Input ~ 0
3.3V
Text GLabel 8800 3700 1    60   Input ~ 0
+5V
$Comp
L FIFO_P:TXB0104 U7
U 1 1 5C4F85F4
P 8500 5050
F 0 "U7" H 8500 4650 60  0000 C CNN
F 1 "TXB0104" H 8500 5450 60  0000 C CNN
F 2 "" H 8500 5100 60  0000 C CNN
F 3 "" H 8500 5100 60  0000 C CNN
	1    8500 5050
	1    0    0    -1  
$EndComp
$Comp
L FIFO_P:TXB0104 U8
U 1 1 5C4FCEC6
P 8500 5950
F 0 "U8" H 8500 5550 60  0000 C CNN
F 1 "TXB0104" H 8500 6350 60  0000 C CNN
F 2 "" H 8500 6000 60  0000 C CNN
F 3 "" H 8500 6000 60  0000 C CNN
	1    8500 5950
	1    0    0    -1  
$EndComp
Text GLabel 7950 5650 1    60   Input ~ 0
3.3V
Text GLabel 8950 4750 2    60   Input ~ 0
+5V
Text GLabel 8950 5650 2    60   Input ~ 0
+5V
Text GLabel 8950 4600 2    60   Input ~ 0
3.3V
NoConn ~ 8050 5250
NoConn ~ 8950 5250
NoConn ~ 8050 6150
NoConn ~ 8950 6150
$Comp
L power:GND #PWR028
U 1 1 5C4FF888
P 8050 4450
F 0 "#PWR028" H 8050 4200 50  0001 C CNN
F 1 "GND" H 8150 4350 50  0000 C CNN
F 2 "" H 8050 4450 50  0000 C CNN
F 3 "" H 8050 4450 50  0000 C CNN
	1    8050 4450
	1    0    0    -1  
$EndComp
NoConn ~ 8050 4350
NoConn ~ 8950 4350
$Comp
L power:GND #PWR029
U 1 1 5C5009CE
P 8050 5350
F 0 "#PWR029" H 8050 5100 50  0001 C CNN
F 1 "GND" H 8150 5250 50  0000 C CNN
F 2 "" H 8050 5350 50  0000 C CNN
F 3 "" H 8050 5350 50  0000 C CNN
	1    8050 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5C501748
P 8050 6250
F 0 "#PWR030" H 8050 6000 50  0001 C CNN
F 1 "GND" H 8050 6100 50  0000 C CNN
F 2 "" H 8050 6250 50  0000 C CNN
F 3 "" H 8050 6250 50  0000 C CNN
	1    8050 6250
	1    0    0    -1  
$EndComp
$Comp
L FIFO_P:TXB0104 U9
U 1 1 5C507482
P 8500 6800
F 0 "U9" H 8500 6400 60  0000 C CNN
F 1 "TXB0104" H 8500 7200 60  0000 C CNN
F 2 "" H 8500 6850 60  0000 C CNN
F 3 "" H 8500 6850 60  0000 C CNN
	1    8500 6800
	1    0    0    -1  
$EndComp
NoConn ~ 8950 7000
NoConn ~ 8050 7000
NoConn ~ 8950 6900
Text GLabel 8950 6350 2    60   Input ~ 0
3.3V
Text GLabel 8950 6500 2    60   Input ~ 0
+5V
Text GLabel 8950 7100 2    60   Input ~ 0
3.3V
$Comp
L power:GND #PWR031
U 1 1 5C50F630
P 11000 3250
F 0 "#PWR031" H 11000 3000 50  0001 C CNN
F 1 "GND" H 11000 3100 50  0000 C CNN
F 2 "" H 11000 3250 50  0000 C CNN
F 3 "" H 11000 3250 50  0000 C CNN
	1    11000 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	400  2450 400  2550
Wire Wire Line
	400  2550 750  2550
Wire Wire Line
	600  2250 750  2250
Connection ~ 750  2250
Wire Wire Line
	1150 2250 1950 2250
Connection ~ 1950 2250
Wire Wire Line
	450  3100 450  3200
Wire Wire Line
	450  3200 750  3200
Connection ~ 750  2900
Wire Wire Line
	2100 2250 2100 2850
Wire Wire Line
	1150 2450 1950 2450
Wire Wire Line
	2000 2450 2000 2950
Wire Wire Line
	2000 2950 2100 2950
Wire Wire Line
	1150 2900 1150 2450
Connection ~ 1950 2450
Wire Wire Line
	850  2900 850  3400
Connection ~ 850  2900
Wire Wire Line
	1000 3250 1000 3000
Wire Wire Line
	1000 3000 1300 3000
Wire Wire Line
	1600 3000 1800 3000
Wire Wire Line
	1900 3000 1900 3050
Wire Wire Line
	1900 3050 2100 3050
Wire Wire Line
	850  3400 1250 3400
Wire Wire Line
	1500 3250 1800 3250
Wire Wire Line
	1800 3250 1800 3000
Connection ~ 1800 3000
Wire Wire Line
	1900 3250 1900 3450
Wire Wire Line
	2100 3550 2100 3600
Connection ~ 2100 3600
Wire Wire Line
	1900 3950 1900 3600
Wire Wire Line
	1900 3600 2100 3600
Wire Wire Line
	1550 3950 1800 3950
Connection ~ 1650 3650
Wire Wire Line
	2100 3500 1800 3500
Wire Wire Line
	1800 3500 1800 3650
Wire Wire Line
	1800 3650 1650 3650
Connection ~ 1800 3650
Wire Wire Line
	1800 3900 1800 3950
Connection ~ 1800 3950
Wire Wire Line
	3350 3150 3350 3250
Wire Wire Line
	3350 3050 3550 3050
Wire Wire Line
	3350 3350 3450 3350
Wire Wire Line
	3350 3250 3550 3250
Wire Wire Line
	3350 2350 3350 2850
Wire Wire Line
	3350 5050 3350 4550
Wire Wire Line
	3350 3850 4450 3850
Wire Wire Line
	3350 3950 4450 3950
Wire Wire Line
	3350 4050 4450 4050
Wire Wire Line
	3350 4150 4450 4150
Wire Wire Line
	3350 4250 4450 4250
Wire Wire Line
	3350 4350 4450 4350
Wire Wire Line
	3350 4450 4450 4450
Wire Wire Line
	2100 5100 3400 5100
Wire Wire Line
	3400 5100 3400 4550
Wire Wire Line
	3400 4550 4450 4550
Wire Wire Line
	2100 4450 2050 4450
Wire Wire Line
	2050 4450 2050 5150
Wire Wire Line
	2050 5150 3450 5150
Wire Wire Line
	3450 5150 3450 4650
Wire Wire Line
	3450 4650 4450 4650
Wire Wire Line
	2100 4350 2000 4350
Wire Wire Line
	2000 4350 2000 5200
Wire Wire Line
	2000 5200 3500 5200
Wire Wire Line
	3500 5200 3500 4750
Wire Wire Line
	3500 4750 4450 4750
Wire Wire Line
	4450 4850 3550 4850
Wire Wire Line
	3550 4850 3550 5250
Wire Wire Line
	3550 5250 1950 5250
Wire Wire Line
	1950 5250 1950 4250
Wire Wire Line
	1950 4250 2100 4250
Wire Wire Line
	2100 4150 1900 4150
Wire Wire Line
	1900 4150 1900 5400
Wire Wire Line
	1900 5400 5000 5400
Wire Wire Line
	5000 5400 5000 5250
Wire Wire Line
	2100 4050 1850 4050
Wire Wire Line
	1850 4050 1850 5450
Wire Wire Line
	1850 5450 5100 5450
Wire Wire Line
	5100 5450 5100 5250
Wire Wire Line
	2100 3950 2000 3950
Wire Wire Line
	2000 3950 2000 4000
Wire Wire Line
	2000 4000 1800 4000
Wire Wire Line
	1800 4000 1800 5500
Wire Wire Line
	1800 5500 5200 5500
Wire Wire Line
	5200 5500 5200 5250
Wire Wire Line
	3350 3650 3750 3650
Wire Wire Line
	3950 3650 3950 3750
Wire Wire Line
	3950 3750 4200 3750
Wire Wire Line
	4450 3550 4450 3650
Wire Wire Line
	5700 5250 5700 5550
Wire Wire Line
	6000 5250 6000 5350
Wire Wire Line
	10600 4750 10550 4750
Wire Wire Line
	10650 4650 10550 4650
Wire Wire Line
	10700 4550 10550 4550
Wire Wire Line
	10750 4450 10550 4450
Wire Wire Line
	10550 4150 10700 4150
Wire Wire Line
	10550 1750 10550 3750
Wire Wire Line
	5050 2950 5050 1900
Wire Wire Line
	5150 2950 5150 1900
Wire Wire Line
	5250 2950 5250 1900
Wire Wire Line
	5350 2950 5350 1900
Wire Wire Line
	5550 2200 5450 2200
Wire Wire Line
	5450 2200 5450 1900
Wire Wire Line
	5650 2950 5650 2100
Wire Wire Line
	5650 2100 5550 2100
Wire Wire Line
	5550 2100 5550 2000
Wire Wire Line
	5750 2950 5750 2100
Wire Wire Line
	5750 2100 5850 2100
Wire Wire Line
	5850 2100 5850 1900
Wire Wire Line
	5950 2950 5950 2150
Wire Wire Line
	5950 2150 6350 2150
Wire Wire Line
	6350 2150 6350 1900
Wire Wire Line
	6050 2950 6050 2250
Wire Wire Line
	6050 2250 6550 2250
Wire Wire Line
	6550 2250 6550 1900
Wire Wire Line
	6250 2950 6250 2350
Wire Wire Line
	6250 2350 6850 2350
Wire Wire Line
	6850 2350 6850 2000
Wire Wire Line
	6350 2950 6350 2450
Wire Wire Line
	6350 2450 7050 2450
Wire Wire Line
	6450 2950 6450 2550
Wire Wire Line
	6450 2550 6950 2550
Wire Wire Line
	4450 3350 4450 2450
Wire Wire Line
	4450 2450 4750 2450
Wire Wire Line
	4750 2450 4750 1900
Wire Wire Line
	4450 3450 4250 3450
Wire Wire Line
	4250 3450 4250 2350
Wire Wire Line
	4250 2350 4850 2350
Wire Wire Line
	4850 2350 4850 1900
Wire Wire Line
	1400 6650 1650 6650
Wire Wire Line
	2450 6550 2500 6550
Wire Wire Line
	2500 6550 2500 6650
Wire Wire Line
	2500 6650 2600 6650
Wire Wire Line
	2450 6350 2600 6350
Connection ~ 2600 6350
Connection ~ 2600 6650
Wire Wire Line
	1400 6550 1650 6550
Wire Wire Line
	2400 7350 2500 7350
Connection ~ 2500 7350
Connection ~ 2750 7350
Connection ~ 2750 7050
Connection ~ 2500 7050
Connection ~ 4200 3750
Connection ~ 4350 3750
Wire Wire Line
	4050 3550 4200 3550
Connection ~ 4350 3550
Connection ~ 4200 3550
Wire Wire Line
	6300 5250 6300 5350
Wire Wire Line
	6250 5350 6300 5350
Connection ~ 6300 5350
Wire Wire Line
	6050 5350 6000 5350
Connection ~ 6000 5350
Wire Wire Line
	6250 5500 6300 5500
Connection ~ 6300 5500
Wire Wire Line
	6000 5500 6050 5500
Connection ~ 6000 5500
Wire Wire Line
	5850 2400 5850 2500
Wire Wire Line
	5450 2400 5450 2500
Wire Wire Line
	5550 2950 5550 2200
Wire Wire Line
	5450 2500 5500 2500
Connection ~ 5450 2500
Wire Wire Line
	5500 2650 5450 2650
Connection ~ 5450 2650
Wire Wire Line
	5700 2650 5850 2650
Connection ~ 5850 2650
Wire Wire Line
	5700 2500 5850 2500
Connection ~ 5850 2500
Wire Wire Line
	7000 4750 7350 4750
Wire Wire Line
	7150 4350 7000 4350
Wire Wire Line
	6350 3850 6500 3850
Wire Wire Line
	6350 3550 6500 3550
Wire Wire Line
	6350 3550 6350 3600
Wire Wire Line
	6350 3800 6350 3850
Wire Wire Line
	6500 3850 6500 3800
Connection ~ 6500 3850
Wire Wire Line
	6500 3600 6500 3550
Connection ~ 6500 3550
Wire Wire Line
	7000 3750 7700 3750
Wire Wire Line
	7000 3650 7750 3650
Wire Wire Line
	7100 3500 7800 3500
Wire Wire Line
	7100 3500 7100 3450
Wire Wire Line
	7100 3450 7000 3450
Wire Wire Line
	7150 3450 7150 3350
Wire Wire Line
	7150 3350 7000 3350
Wire Wire Line
	6400 5250 6400 5450
Wire Wire Line
	7250 5450 7250 3950
Wire Wire Line
	7250 3950 8050 3950
Wire Wire Line
	6500 5250 6500 5350
Wire Wire Line
	7300 5350 7300 4050
Wire Wire Line
	7350 4750 7350 4150
Wire Wire Line
	7400 4650 7400 4250
Wire Wire Line
	7450 4550 7450 4350
Wire Wire Line
	7450 4350 7950 4350
Wire Wire Line
	7150 4300 7150 4350
Wire Wire Line
	7500 5050 8050 5050
Wire Wire Line
	7550 4200 7550 5150
Wire Wire Line
	7550 5150 8050 5150
Wire Wire Line
	7600 5750 8050 5750
Wire Wire Line
	7650 4000 7650 5850
Wire Wire Line
	7650 5850 8050 5850
Wire Wire Line
	7700 3750 7700 5950
Wire Wire Line
	7700 5950 8050 5950
Wire Wire Line
	7750 3650 7750 6050
Wire Wire Line
	7750 6050 8050 6050
Wire Wire Line
	7800 3500 7800 6600
Wire Wire Line
	7850 6700 8050 6700
Wire Wire Line
	7850 6700 7850 3450
Wire Wire Line
	7850 3450 7150 3450
Wire Wire Line
	2100 4850 2450 4850
Connection ~ 3450 3350
Wire Wire Line
	3350 3550 3450 3550
Connection ~ 3450 3550
Wire Wire Line
	3350 3550 3350 3450
Connection ~ 3550 3050
Wire Wire Line
	4050 3250 4050 3550
Connection ~ 3550 3250
Connection ~ 3750 3650
Connection ~ 2450 4850
Wire Wire Line
	2400 7050 2500 7050
Wire Wire Line
	2400 7250 2400 7050
Wire Wire Line
	2450 6450 2450 6350
Connection ~ 1300 3000
Wire Wire Line
	1950 3150 2100 3150
Wire Wire Line
	1900 3250 2100 3250
Wire Wire Line
	1900 3450 1650 3450
Wire Wire Line
	1400 6350 1650 6350
Wire Wire Line
	1250 6150 1250 6050
Wire Wire Line
	1250 6050 1400 6050
Wire Wire Line
	6500 5350 7300 5350
Wire Wire Line
	7050 2450 7050 1900
Wire Wire Line
	6950 2550 6950 1900
Wire Wire Line
	10550 4050 10900 4050
Wire Wire Line
	3950 3250 3950 2900
Wire Wire Line
	5550 2000 6850 2000
Connection ~ 6850 2000
Connection ~ 5550 2000
Wire Wire Line
	7150 3550 7150 3500
Wire Wire Line
	7000 4550 7450 4550
Wire Wire Line
	7000 4650 7400 4650
Wire Wire Line
	10550 4250 10800 4250
Wire Wire Line
	10800 4250 10800 4350
Wire Wire Line
	8050 3850 8050 3750
Wire Wire Line
	8950 3850 8950 3750
Wire Wire Line
	8950 3750 8800 3750
Wire Wire Line
	8800 3750 8800 3700
Wire Wire Line
	7000 4450 7900 4450
Wire Wire Line
	7900 4450 7900 4950
Wire Wire Line
	7900 4950 8050 4950
Wire Wire Line
	7950 4350 7950 4850
Wire Wire Line
	7950 4850 8050 4850
Wire Wire Line
	7950 5650 8050 5650
Wire Wire Line
	8050 5650 8050 5500
Wire Wire Line
	8050 5500 8950 5500
Wire Wire Line
	8950 5500 8950 5350
Wire Wire Line
	8050 4750 8050 4600
Wire Wire Line
	8050 4600 8950 4600
Wire Wire Line
	8950 4600 8950 4450
Wire Wire Line
	8950 3950 9550 3950
Wire Wire Line
	8950 4050 9550 4050
Wire Wire Line
	8950 4150 9550 4150
Wire Wire Line
	8950 4250 9550 4250
Wire Wire Line
	8950 4850 9250 4850
Wire Wire Line
	9250 4850 9250 4350
Wire Wire Line
	9250 4350 9550 4350
Wire Wire Line
	8950 4950 9300 4950
Wire Wire Line
	9300 4950 9300 4450
Wire Wire Line
	9300 4450 9550 4450
Wire Wire Line
	8950 5050 9350 5050
Wire Wire Line
	9350 5050 9350 4550
Wire Wire Line
	9350 4550 9550 4550
Wire Wire Line
	8950 5150 9400 5150
Wire Wire Line
	9400 5150 9400 4650
Wire Wire Line
	9400 4650 9550 4650
Wire Wire Line
	9550 4750 9450 4750
Wire Wire Line
	9450 4750 9450 5750
Wire Wire Line
	9450 5750 8950 5750
Wire Wire Line
	8950 5850 10550 5850
Wire Wire Line
	10550 5850 10550 4850
Wire Wire Line
	8950 5950 10600 5950
Wire Wire Line
	10600 5950 10600 4750
Wire Wire Line
	8950 6050 10650 6050
Wire Wire Line
	10650 6050 10650 4650
Wire Wire Line
	7800 6600 8050 6600
Wire Wire Line
	8950 6600 10700 6600
Wire Wire Line
	10700 6600 10700 4550
Wire Wire Line
	8950 6700 10750 6700
Wire Wire Line
	10750 6700 10750 4450
Wire Wire Line
	8050 6500 8050 6400
Wire Wire Line
	8050 6400 8250 6400
Wire Wire Line
	8250 6400 8250 6350
Wire Wire Line
	8250 6350 8950 6350
Wire Wire Line
	8950 6350 8950 6250
Wire Wire Line
	6400 5450 7250 5450
Wire Wire Line
	10550 3950 10750 3950
Wire Wire Line
	10550 3850 10600 3850
Wire Wire Line
	10750 3250 11000 3250
Wire Wire Line
	7350 1250 8550 1250
Wire Wire Line
	9550 1850 9550 3750
$Comp
L FIFO_P:Rotary_Encoder_61C SW1
U 1 1 5C522B79
P 10650 850
F 0 "SW1" H 10650 1200 50  0000 C CNN
F 1 "Rotary_Encoder_61C" H 10550 500 50  0000 C CNN
F 2 "" H 10650 850 50  0000 C CNN
F 3 "" H 10650 850 50  0000 C CNN
	1    10650 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5C522CDE
P 9750 600
F 0 "R9" V 9830 600 50  0000 C CNN
F 1 "3.3k" V 9750 600 50  0000 C CNN
F 2 "" V 9680 600 50  0000 C CNN
F 3 "" H 9750 600 50  0000 C CNN
	1    9750 600 
	0    1    1    0   
$EndComp
Wire Wire Line
	9900 600  9950 600 
Wire Wire Line
	9600 600  9600 700 
Wire Wire Line
	7350 700  9600 700 
Connection ~ 9600 700 
Text GLabel 10050 600  1    60   Input ~ 0
3.3V
Wire Wire Line
	7350 800  9500 800 
$Comp
L Device:R R7
U 1 1 5C4F5833
P 9500 500
F 0 "R7" V 9580 500 50  0000 C CNN
F 1 "3.3k" V 9500 500 50  0000 C CNN
F 2 "" V 9430 500 50  0000 C CNN
F 3 "" H 9500 500 50  0000 C CNN
	1    9500 500 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 800  9500 650 
Wire Wire Line
	9500 350  9950 350 
Wire Wire Line
	9950 350  9950 600 
Connection ~ 9950 600 
Connection ~ 9500 800 
Wire Wire Line
	10150 900  10050 900 
Wire Wire Line
	10050 900  10050 600 
Connection ~ 10050 600 
Wire Wire Line
	7350 900  9250 900 
Wire Wire Line
	9250 900  9250 1000
Wire Wire Line
	9250 1000 9450 1000
Wire Wire Line
	9850 1100 10050 1100
Wire Wire Line
	10050 1100 10050 1200
$Comp
L power:GND #PWR032
U 1 1 5C4F8025
P 10050 1200
F 0 "#PWR032" H 10050 950 50  0001 C CNN
F 1 "GND" H 10050 1050 50  0000 C CNN
F 2 "" H 10050 1200 50  0000 C CNN
F 3 "" H 10050 1200 50  0000 C CNN
	1    10050 1200
	1    0    0    -1  
$EndComp
Text Notes 2000 750  0    60   ~ 0
Default = Connected
Wire Bus Line
	1900 750  3050 750 
Wire Bus Line
	3050 750  3050 1600
Wire Bus Line
	3050 1600 1900 1600
Wire Bus Line
	1900 1600 1900 750 
Wire Bus Line
	3250 5850 750  5850
Wire Bus Line
	750  5850 750  7800
Wire Bus Line
	750  7800 3250 7800
Wire Bus Line
	3250 7800 3250 5850
Text Notes 1300 5800 0    60   ~ 0
Clock distribution and control
Wire Bus Line
	9000 300  11000 300 
Wire Bus Line
	11000 300  11000 1500
Wire Bus Line
	11000 1500 9000 1500
Wire Bus Line
	9000 1500 9000 300 
Text Notes 9650 1600 0    60   ~ 0
Rotary Encoder
$Comp
L Device:R R8
U 1 1 5C4FE27C
P 9600 1150
F 0 "R8" V 9680 1150 50  0000 C CNN
F 1 "10k" V 9600 1150 50  0000 C CNN
F 2 "" V 9530 1150 50  0000 C CNN
F 3 "" H 9600 1150 50  0000 C CNN
	1    9600 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 1000 9450 1150
Connection ~ 9450 1000
Wire Wire Line
	9750 1150 9850 1150
Wire Wire Line
	9850 1150 9850 1100
Connection ~ 10050 1100
Wire Wire Line
	8050 6900 7950 6900
Wire Wire Line
	7950 6900 7950 7100
Wire Wire Line
	7950 7100 8050 7100
Text GLabel 8050 6800 0    60   Input ~ 0
LDAC
Text GLabel 8950 6800 2    60   Input ~ 0
LDAC5V
Text GLabel 9550 3850 0    60   Input ~ 0
LDAC5V
Wire Wire Line
	7350 1150 8650 1150
Wire Wire Line
	8650 1150 8650 1750
Wire Wire Line
	8650 1750 10550 1750
Wire Wire Line
	8550 1250 8550 1850
Wire Wire Line
	8550 1850 9550 1850
NoConn ~ 7350 1350
Wire Wire Line
	7000 4000 7650 4000
Wire Wire Line
	7000 4000 7000 3950
Wire Wire Line
	7000 4050 7000 4100
Wire Wire Line
	7300 4050 8050 4050
Wire Wire Line
	7000 4100 7600 4100
Wire Wire Line
	7600 4100 7600 5750
Wire Wire Line
	7550 4200 7000 4200
Wire Wire Line
	7000 4200 7000 4150
Wire Wire Line
	7350 4150 8050 4150
Wire Wire Line
	7400 4250 8050 4250
Wire Wire Line
	7150 4300 7500 4300
Wire Wire Line
	7500 4300 7500 5050
Text Notes 7850 3250 0    60   ~ 0
TXB0104 chips translate the \n3.3V logic from the FIFO to \n5V LOGIC for the AD7840 DAC
Wire Notes Line
	8500 3300 8500 3600
$Sheet
S 5300 6450 500  400 
U 5C530B6E
F0 "Sheet5C530B6D" 60
F1 "FIFO_P_power.sch" 60
$EndSheet
Text Notes 450  1950 0    60   ~ 0
For DC coupled, Dual Supply, non-differential signaling,\n(i.e. a single singnal on a signle cable) JP1 connedts pins 1 & 2.\nR4 and C1 create an RC filter to reduce noise.
Wire Notes Line
	1450 2000 1450 2750
Text GLabel 4150 1050 0    60   Input ~ 0
+5V
Wire Wire Line
	2600 2350 2600 2500
Wire Wire Line
	750  2250 850  2250
Wire Wire Line
	1950 2250 2100 2250
Wire Wire Line
	750  2900 850  2900
Wire Wire Line
	1950 2450 2000 2450
Wire Wire Line
	1800 3000 1900 3000
Wire Wire Line
	2100 3600 2100 3650
Wire Wire Line
	1800 3650 1800 3700
Wire Wire Line
	1800 3950 1900 3950
Wire Wire Line
	2600 6350 2825 6350
Wire Wire Line
	2600 6650 2825 6650
Wire Wire Line
	2500 7350 2750 7350
Wire Wire Line
	2750 7350 2850 7350
Wire Wire Line
	2750 7050 2850 7050
Wire Wire Line
	2500 7050 2750 7050
Wire Wire Line
	4200 3750 4350 3750
Wire Wire Line
	4350 3750 4450 3750
Wire Wire Line
	4350 3550 4450 3550
Wire Wire Line
	4200 3550 4350 3550
Wire Wire Line
	6300 5350 6300 5500
Wire Wire Line
	6000 5350 6000 5500
Wire Wire Line
	6300 5500 6300 5550
Wire Wire Line
	6000 5500 6000 5550
Wire Wire Line
	5450 2500 5450 2650
Wire Wire Line
	5450 2650 5450 2950
Wire Wire Line
	5850 2650 5850 2950
Wire Wire Line
	5850 2500 5850 2650
Wire Wire Line
	6500 3550 7000 3550
Wire Wire Line
	3450 3350 3750 3350
Wire Wire Line
	3450 3550 3900 3550
Wire Wire Line
	3550 3050 3750 3050
Wire Wire Line
	3550 3250 3950 3250
Wire Wire Line
	3750 3650 3950 3650
Wire Wire Line
	2450 4850 2700 4850
Wire Wire Line
	1300 3000 1400 3000
Wire Wire Line
	6850 2000 6850 1900
Wire Wire Line
	5550 2000 5550 1900
Wire Wire Line
	9600 700  10150 700 
Wire Wire Line
	9950 600  10050 600 
Wire Wire Line
	9500 800  10150 800 
Wire Wire Line
	10050 600  10150 600 
Wire Wire Line
	9450 1000 10150 1000
Wire Wire Line
	10050 1100 10150 1100
Wire Wire Line
	2700 5050 3350 5050
Wire Wire Line
	2100 3850 2100 5100
$Comp
L FIFO_P:ARDUINO_DUE_FIFO_P_COMMANDS U4
U 1 1 5D0AD907
P 5650 1200
F 0 "U4" H 5750 2037 60  0000 C CNN
F 1 "ARDUINO_DUE_FIFO_P_COMMANDS" H 5750 1931 60  0000 C CNN
F 2 "" H 5650 50  60  0000 C CNN
F 3 "" H 5650 50  60  0000 C CNN
	1    5650 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2350 3350 2350
Wire Wire Line
	2100 3350 2100 3500
Wire Wire Line
	2950 2350 2900 2350
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 5D0F610C
P 1250 3250
F 0 "JP1" H 1250 3454 50  0000 C CNN
F 1 "Jumper_3_Bridged12" H 1250 3363 50  0000 C CNN
F 2 "" H 1250 3250 50  0001 C CNN
F 3 "~" H 1250 3250 50  0001 C CNN
	1    1250 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 5D116186
P 2450 1000
F 0 "JP2" H 2450 1264 50  0000 C CNN
F 1 "Jumper" H 2450 1173 50  0000 C CNN
F 2 "" H 2450 1000 50  0001 C CNN
F 3 "~" H 2450 1000 50  0001 C CNN
	1    2450 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP3
U 1 1 5D11779A
P 2450 1400
F 0 "JP3" H 2450 1664 50  0000 C CNN
F 1 "Jumper" H 2450 1573 50  0000 C CNN
F 2 "" H 2450 1400 50  0001 C CNN
F 3 "~" H 2450 1400 50  0001 C CNN
	1    2450 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5250 5700 5250
Wire Wire Line
	6500 3850 7000 3850
$Comp
L FIFO_P:IDT_72V2105 U?
U 1 1 5D0ADC94
P 5700 4100
F 0 "U?" H 7044 4153 60  0000 L CNN
F 1 "IDT_72V2105" H 7044 4047 60  0000 L CNN
F 2 "" H 5700 4100 60  0000 C CNN
F 3 "" H 5700 4100 60  0000 C CNN
	1    5700 4100
	1    0    0    -1  
$EndComp
Connection ~ 4450 3550
Connection ~ 7000 3850
Wire Wire Line
	7000 3850 7350 3850
Connection ~ 5700 5250
Connection ~ 7000 3550
$Comp
L FIFO_P:IDT_ICS551 U?
U 1 1 5D0AF0AA
P 2050 6500
F 0 "U?" H 2050 6897 60  0000 C CNN
F 1 "IDT_ICS551" H 2050 6791 60  0000 C CNN
F 2 "" H 2050 6500 60  0000 C CNN
F 3 "" H 2050 6500 60  0000 C CNN
	1    2050 6500
	1    0    0    -1  
$EndComp
Connection ~ 2450 6350
$Comp
L Device:R_POT RV1k
U 1 1 5D0CC1AD
P 10750 3550
F 0 "RV1k" H 10680 3504 50  0000 R CNN
F 1 "R_POT" H 10680 3595 50  0000 R CNN
F 2 "" H 10750 3550 50  0001 C CNN
F 3 "~" H 10750 3550 50  0001 C CNN
	1    10750 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	10750 3950 10750 3700
Wire Wire Line
	10600 3550 10600 3850
Wire Wire Line
	10750 3250 10750 3400
$Comp
L Connector:Conn_Coaxial J?
U 1 1 5D0AD9DC
P 450 2900
F 0 "J?" H 378 3138 50  0000 C CNN
F 1 "Vin -" H 378 3047 50  0000 C CNN
F 2 "" H 450 2900 50  0001 C CNN
F 3 " ~" H 450 2900 50  0001 C CNN
	1    450  2900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial J?
U 1 1 5D0AEC74
P 400 2250
F 0 "J?" H 328 2488 50  0000 C CNN
F 1 "Vin +" H 328 2397 50  0000 C CNN
F 2 "" H 400 2250 50  0001 C CNN
F 3 " ~" H 400 2250 50  0001 C CNN
	1    400  2250
	-1   0    0    -1  
$EndComp
Connection ~ 450  3200
Wire Wire Line
	650  2900 750  2900
Connection ~ 400  2550
$Comp
L Connector:Conn_Coaxial J?
U 1 1 5D10C7C1
P 10900 4150
F 0 "J?" H 11000 4125 50  0000 L CNN
F 1 "Conn_Coaxial" H 11000 4034 50  0000 L CNN
F 2 "" H 10900 4150 50  0001 C CNN
F 3 " ~" H 10900 4150 50  0001 C CNN
	1    10900 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 4350 10900 4350
$Comp
L Connector:TestPoint TP?
U 1 1 5D12D8D6
P 10900 3950
F 0 "TP?" H 10958 4068 50  0000 L CNN
F 1 "TestPoint" H 10958 3977 50  0000 L CNN
F 2 "" H 11100 3950 50  0001 C CNN
F 3 "~" H 11100 3950 50  0001 C CNN
	1    10900 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 3950 10900 4050
Connection ~ 10900 4050
Wire Wire Line
	10900 4050 10950 4050
$Comp
L Connector:TestPoint TP?
U 1 1 5D243F89
P 4050 3250
F 0 "TP?" H 4108 3368 50  0000 L CNN
F 1 "TestPoint" H 4108 3277 50  0000 L CNN
F 2 "" H 4250 3250 50  0001 C CNN
F 3 "~" H 4250 3250 50  0001 C CNN
	1    4050 3250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D246EE2
P 1250 6150
F 0 "TP?" H 1193 6176 50  0000 R CNN
F 1 "TestPoint" H 1193 6267 50  0000 R CNN
F 2 "" H 1450 6150 50  0001 C CNN
F 3 "~" H 1450 6150 50  0001 C CNN
	1    1250 6150
	1    0    0    1   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D28577F
P 2600 6350
F 0 "TP?" H 2658 6468 50  0000 L CNN
F 1 "TestPoint" H 2658 6377 50  0000 L CNN
F 2 "" H 2800 6350 50  0001 C CNN
F 3 "~" H 2800 6350 50  0001 C CNN
	1    2600 6350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
