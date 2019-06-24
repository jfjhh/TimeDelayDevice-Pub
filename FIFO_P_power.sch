EESchema Schematic File Version 4
LIBS:FIFO_P-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date "2019-01-30"
Rev ""
Comp "Reed College"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L FIFO_P:LM2940CT-5.0 U12
U 1 1 5C53126A
P 2150 900
F 0 "U12" H 1950 1100 50  0000 C CNN
F 1 "LM2940CT-5.0" H 2150 1100 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 2150 1200 50  0000 C CIN
F 3 "" H 2150 900 50  0000 C CNN
	1    2150 900 
	1    0    0    -1  
$EndComp
$Comp
L FIFO_P:LM2940CT-3.3 U13
U 1 1 5C531271
P 3800 900
F 0 "U13" H 3600 1100 50  0000 C CNN
F 1 "LM2940CT-3.3" H 3800 1100 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 3800 1200 50  0000 C CIN
F 3 "" H 3800 900 50  0000 C CNN
	1    3800 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 5C531278
P 2700 1000
F 0 "C26" H 2725 1100 50  0000 L CNN
F 1 "22uF" H 2725 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2738 850 50  0001 C CNN
F 3 "" H 2700 1000 50  0000 C CNN
	1    2700 1000
	1    0    0    -1  
$EndComp
Text GLabel 2800 850  1    60   Input ~ 0
+5V
$Comp
L power:GND #PWR040
U 1 1 5C531288
P 2950 1400
F 0 "#PWR040" H 2950 1150 50  0001 C CNN
F 1 "GND" H 2950 1250 50  0000 C CNN
F 2 "" H 2950 1400 50  0000 C CNN
F 3 "" H 2950 1400 50  0000 C CNN
	1    2950 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 5C53128E
P 4250 1000
F 0 "C29" H 4275 1100 50  0000 L CNN
F 1 "22uF" H 4275 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4288 850 50  0001 C CNN
F 3 "" H 4250 1000 50  0000 C CNN
	1    4250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 850  1150 850 
Connection ~ 1400 850 
Wire Wire Line
	1400 1150 1750 1150
Connection ~ 1750 1150
Wire Wire Line
	2950 1150 2950 1400
Connection ~ 2150 1150
Connection ~ 2950 1150
Wire Wire Line
	2550 850  2700 850 
Connection ~ 2700 850 
Connection ~ 2700 1150
Wire Wire Line
	4200 850  4250 850 
Connection ~ 4250 850 
Connection ~ 3800 1150
Connection ~ 4250 1150
Text GLabel 4800 850  2    60   Input ~ 0
3.3V
Text Notes 5350 1150 0    75   ~ 15
A low-noise power supply can improve the accuracy and stability of the circuit. \nThis page includes a possible implementation. Using the suggested chips:\n\nVin+ = 7 to 25V
$Comp
L Device:C C28
U 1 1 5C53184C
P 3250 1000
F 0 "C28" H 3275 1100 50  0000 L CNN
F 1 ".47uF" H 3275 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3288 850 50  0001 C CNN
F 3 "" H 3250 1000 50  0000 C CNN
	1    3250 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C30
U 1 1 5C53194F
P 4600 1000
F 0 "C30" H 4625 1100 50  0000 L CNN
F 1 ".47uF" H 4625 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 4638 850 50  0001 C CNN
F 3 "" H 4600 1000 50  0000 C CNN
	1    4600 1000
	1    0    0    -1  
$EndComp
Connection ~ 4600 850 
$Comp
L Device:C C22
U 1 1 5C532D36
P 1750 1000
F 0 "C22" H 1775 1100 50  0000 L CNN
F 1 ".47uF" H 1775 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1788 850 50  0001 C CNN
F 3 "" H 1750 1000 50  0000 C CNN
	1    1750 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5C532D3C
P 1400 1000
F 0 "C21" H 1425 1100 50  0000 L CNN
F 1 "22uF" H 1425 900 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 1438 850 50  0001 C CNN
F 3 "" H 1400 1000 50  0000 C CNN
	1    1400 1000
	1    0    0    -1  
$EndComp
Connection ~ 3250 1150
Connection ~ 3250 850 
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5C534995
P 1150 850
F 0 "#FLG02" H 1150 945 50  0001 C CNN
F 1 "PWR_FLAG" H 1100 1000 50  0000 C CNN
F 2 "" H 1150 850 50  0000 C CNN
F 3 "" H 1150 850 50  0000 C CNN
	1    1150 850 
	1    0    0    -1  
$EndComp
Connection ~ 1150 850 
Connection ~ 3050 850 
$Comp
L Connector:TestPoint TP4
U 1 1 5D244D32
P 1400 850
F 0 "TP4" H 1458 968 50  0000 L CNN
F 1 "TestPoint" H 1458 877 50  0000 L CNN
F 2 "FIFO_P:Test_Pin" H 1600 850 50  0001 C CNN
F 3 "~" H 1600 850 50  0001 C CNN
	1    1400 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 5D2450B6
P 3050 850
F 0 "TP5" H 3108 968 50  0000 L CNN
F 1 "TestPoint" H 3108 877 50  0000 L CNN
F 2 "FIFO_P:Test_Pin" H 3250 850 50  0001 C CNN
F 3 "~" H 3250 850 50  0001 C CNN
	1    3050 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5D2454BF
P 4600 850
F 0 "TP7" H 4658 968 50  0000 L CNN
F 1 "TestPoint" H 4658 877 50  0000 L CNN
F 2 "FIFO_P:Test_Pin" H 4800 850 50  0001 C CNN
F 3 "~" H 4800 850 50  0001 C CNN
	1    4600 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 850  1750 850 
Wire Wire Line
	1750 1150 2150 1150
Wire Wire Line
	2150 1150 2700 1150
Wire Wire Line
	2950 1150 3250 1150
Wire Wire Line
	2700 850  3050 850 
Wire Wire Line
	2700 1150 2950 1150
Wire Wire Line
	4250 850  4600 850 
Wire Wire Line
	3800 1150 4250 1150
Wire Wire Line
	4250 1150 4600 1150
Wire Wire Line
	4600 850  4800 850 
Wire Wire Line
	3250 1150 3800 1150
Wire Wire Line
	3250 850  3400 850 
Wire Wire Line
	3050 850  3250 850 
$Comp
L Connector:Jack-DC J5
U 1 1 5D418214
P 700 950
F 0 "J5" H 700 1250 50  0000 C CNN
F 1 "Jack-DC" H 700 1150 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 750 910 50  0001 C CNN
F 3 "~" H 750 910 50  0001 C CNN
	1    700  950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5D419D2C
P 1150 1050
F 0 "#PWR036" H 1150 800 50  0001 C CNN
F 1 "GND" H 1155 877 50  0000 C CNN
F 2 "" H 1150 1050 50  0001 C CNN
F 3 "" H 1150 1050 50  0001 C CNN
	1    1150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1050 1150 1050
Connection ~ 1750 850 
Wire Wire Line
	1150 850  1400 850 
Wire Wire Line
	3700 2250 3900 2250
Connection ~ 3700 2250
Wire Wire Line
	3700 2250 3700 2150
$Comp
L Connector:TestPoint TP6
U 1 1 5D15469A
P 3700 2150
F 0 "TP6" H 3758 2268 50  0000 L CNN
F 1 "TestPoint" H 3758 2177 50  0000 L CNN
F 2 "FIFO_P:Test_Pin" H 3900 2150 50  0001 C CNN
F 3 "~" H 3900 2150 50  0001 C CNN
	1    3700 2150
	1    0    0    -1  
$EndComp
Connection ~ 2950 2250
Wire Wire Line
	2950 2250 3400 2250
Text GLabel 3900 2250 2    60   Input ~ 0
-5V
Wire Wire Line
	1650 2000 1200 2000
Wire Wire Line
	1650 2050 1650 2000
Connection ~ 1200 2000
Wire Wire Line
	2050 2250 2500 2250
$Comp
L Device:C C20
U 1 1 5D14A942
P 800 2500
F 0 "C20" H 915 2546 50  0000 L CNN
F 1 ".47uF" H 915 2455 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 838 2350 50  0001 C CNN
F 3 "~" H 800 2500 50  0001 C CNN
	1    800  2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2350 800  2350
Wire Wire Line
	800  2650 1200 2650
Wire Wire Line
	1150 2000 1200 2000
Text GLabel 1150 2000 0    60   Input ~ 0
+5V
$Comp
L power:GND #PWR041
U 1 1 5D15173D
P 2950 2550
F 0 "#PWR041" H 2950 2300 50  0001 C CNN
F 1 "GND" H 2955 2377 50  0000 C CNN
F 2 "" H 2950 2550 50  0001 C CNN
F 3 "" H 2950 2550 50  0001 C CNN
	1    2950 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5D150EB8
P 2500 2550
F 0 "#PWR039" H 2500 2300 50  0001 C CNN
F 1 "GND" H 2505 2377 50  0000 C CNN
F 2 "" H 2500 2550 50  0001 C CNN
F 3 "" H 2500 2550 50  0001 C CNN
	1    2500 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C27
U 1 1 5D15083E
P 2950 2400
F 0 "C27" H 3065 2446 50  0000 L CNN
F 1 "22uF" H 3065 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2988 2250 50  0001 C CNN
F 3 "~" H 2950 2400 50  0001 C CNN
	1    2950 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2250 2950 2250
Connection ~ 2500 2250
$Comp
L Device:C C25
U 1 1 5D150015
P 2500 2400
F 0 "C25" H 2615 2446 50  0000 L CNN
F 1 ".47uF" H 2615 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2538 2250 50  0001 C CNN
F 3 "~" H 2500 2400 50  0001 C CNN
	1    2500 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2250 1200 2000
Wire Wire Line
	1250 2250 1200 2250
$Comp
L power:GND #PWR037
U 1 1 5D14C1B1
P 1650 2750
F 0 "#PWR037" H 1650 2500 50  0001 C CNN
F 1 "GND" H 1655 2577 50  0000 C CNN
F 2 "" H 1650 2750 50  0001 C CNN
F 3 "" H 1650 2750 50  0001 C CNN
	1    1650 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2550 1250 2550
Wire Wire Line
	1200 2650 1200 2550
$Comp
L Device:C C31
U 1 1 5D18736B
P 3400 2400
F 0 "C31" H 3515 2446 50  0000 L CNN
F 1 "22uF" H 3515 2355 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 3438 2250 50  0001 C CNN
F 3 "~" H 3400 2400 50  0001 C CNN
	1    3400 2400
	1    0    0    -1  
$EndComp
Connection ~ 3400 2250
Wire Wire Line
	3400 2250 3700 2250
$Comp
L power:GND #PWR042
U 1 1 5D1879E4
P 3400 2550
F 0 "#PWR042" H 3400 2300 50  0001 C CNN
F 1 "GND" H 3405 2377 50  0000 C CNN
F 2 "" H 3400 2550 50  0001 C CNN
F 3 "" H 3400 2550 50  0001 C CNN
	1    3400 2550
	1    0    0    -1  
$EndComp
$Comp
L Regulator_SwitchedCapacitor:LM2776 U11
U 1 1 5D148E12
P 1650 2350
F 0 "U11" H 2000 2350 50  0000 L CNN
F 1 "LM2776" H 2000 2250 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 1700 2000 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm2776.pdf" H -200 3600 50  0001 C CNN
	1    1650 2350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
