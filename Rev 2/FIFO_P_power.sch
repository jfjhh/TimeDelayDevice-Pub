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
L FIFO_P:LM2940CT-5.0 U11
U 1 1 5C53126A
P 1950 900
F 0 "U11" H 1750 1100 50  0000 C CNN
F 1 "LM2940CT-5.0" H 1950 1100 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 1950 1200 50  0000 C CIN
F 3 "" H 1950 900 50  0000 C CNN
	1    1950 900 
	1    0    0    -1  
$EndComp
$Comp
L FIFO_P:LM2940CT-3.3 U13
U 1 1 5C531271
P 3600 900
F 0 "U13" H 3400 1100 50  0000 C CNN
F 1 "LM2940CT-3.3" H 3600 1100 50  0000 L CNN
F 2 "Power_Integrations:TO-220" H 3600 1200 50  0000 C CIN
F 3 "" H 3600 900 50  0000 C CNN
	1    3600 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 5C531278
P 2500 1000
F 0 "C24" H 2525 1100 50  0000 L CNN
F 1 "22uF" H 2525 900 50  0000 L CNN
F 2 "" H 2538 850 50  0000 C CNN
F 3 "" H 2500 1000 50  0000 C CNN
	1    2500 1000
	1    0    0    -1  
$EndComp
Text GLabel 2600 850  1    60   Input ~ 0
+5V
Text GLabel 800  850  0    60   Input ~ 0
Vin+
$Comp
L Device:C C23
U 1 1 5C531281
P 2350 2450
F 0 "C23" H 2375 2550 50  0000 L CNN
F 1 ".47uF" H 2375 2350 50  0000 L CNN
F 2 "" H 2388 2300 50  0000 C CNN
F 3 "" H 2350 2450 50  0000 C CNN
	1    2350 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 5C531288
P 2750 1400
F 0 "#PWR033" H 2750 1150 50  0001 C CNN
F 1 "GND" H 2750 1250 50  0000 C CNN
F 2 "" H 2750 1400 50  0000 C CNN
F 3 "" H 2750 1400 50  0000 C CNN
	1    2750 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C28
U 1 1 5C53128E
P 4050 1000
F 0 "C28" H 4075 1100 50  0000 L CNN
F 1 "22uF" H 4075 900 50  0000 L CNN
F 2 "" H 4088 850 50  0000 C CNN
F 3 "" H 4050 1000 50  0000 C CNN
	1    4050 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  850  1550 850 
Connection ~ 1200 850 
Wire Wire Line
	1200 1150 4400 1150
Connection ~ 1550 1150
Wire Wire Line
	2750 1150 2750 1400
Connection ~ 1950 1150
Connection ~ 2750 1150
Wire Wire Line
	2350 850  3200 850 
Connection ~ 2500 850 
Connection ~ 2500 1150
Wire Wire Line
	4000 850  4600 850 
Connection ~ 4050 850 
Connection ~ 3600 1150
Connection ~ 4050 1150
Text GLabel 4600 850  2    60   Input ~ 0
3.3V
Text GLabel 3850 2050 2    60   Input ~ 0
-5V
Text Notes 5350 1150 0    75   ~ 15
A low-noise power supply can improve the accuracy and stability of the circuit. \nThis page includes a possible implementation. Using the Suggested chips:\n\nVin+ = 7 to 25V\nVin- = -7 to -25V
$Comp
L Device:C C22
U 1 1 5C5317FC
P 2000 2450
F 0 "C22" H 2025 2550 50  0000 L CNN
F 1 "22uF" H 2025 2350 50  0000 L CNN
F 2 "" H 2038 2300 50  0000 C CNN
F 3 "" H 2000 2450 50  0000 C CNN
	1    2000 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C25
U 1 1 5C53184C
P 3050 1000
F 0 "C25" H 3075 1100 50  0000 L CNN
F 1 ".47uF" H 3075 900 50  0000 L CNN
F 2 "" H 3088 850 50  0000 C CNN
F 3 "" H 3050 1000 50  0000 C CNN
	1    3050 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C29
U 1 1 5C53194F
P 4400 1000
F 0 "C29" H 4425 1100 50  0000 L CNN
F 1 ".47uF" H 4425 900 50  0000 L CNN
F 2 "" H 4438 850 50  0000 C CNN
F 3 "" H 4400 1000 50  0000 C CNN
	1    4400 1000
	1    0    0    -1  
$EndComp
Connection ~ 4400 850 
$Comp
L FIFO_P:UA79M05CKCS_-5V U12
U 1 1 5C531EE5
P 2800 2100
F 0 "U12" H 2600 2300 50  0000 C CNN
F 1 "UA79M05CKCS_-5V" H 2800 2300 50  0000 L CNN
F 2 "TO-220" H 2800 2200 50  0000 C CIN
F 3 "" H 2800 2100 50  0000 C CNN
	1    2800 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2050 2400 2050
Text GLabel 2800 2950 3    60   Input ~ 0
Vin-
Wire Wire Line
	2800 2350 2800 2950
$Comp
L power:GND #PWR034
U 1 1 5C5322F0
P 1800 2050
F 0 "#PWR034" H 1800 1800 50  0001 C CNN
F 1 "GND" H 1800 1900 50  0000 C CNN
F 2 "" H 1800 2050 50  0000 C CNN
F 3 "" H 1800 2050 50  0000 C CNN
	1    1800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2300 2350 2050
Connection ~ 2350 2050
Wire Wire Line
	2000 2300 2000 2050
Connection ~ 2000 2050
Wire Wire Line
	2000 2600 3600 2600
Connection ~ 2800 2600
Connection ~ 2350 2600
$Comp
L Device:C C27
U 1 1 5C532A45
P 3600 2450
F 0 "C27" H 3625 2550 50  0000 L CNN
F 1 ".47uF" H 3625 2350 50  0000 L CNN
F 2 "" H 3638 2300 50  0000 C CNN
F 3 "" H 3600 2450 50  0000 C CNN
	1    3600 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C26
U 1 1 5C532A4B
P 3250 2450
F 0 "C26" H 3275 2550 50  0000 L CNN
F 1 "22uF" H 3275 2350 50  0000 L CNN
F 2 "" H 3288 2300 50  0000 C CNN
F 3 "" H 3250 2450 50  0000 C CNN
	1    3250 2450
	1    0    0    -1  
$EndComp
Connection ~ 3250 2600
Wire Wire Line
	3250 2300 3250 2050
Wire Wire Line
	3200 2050 3850 2050
Wire Wire Line
	3600 2050 3600 2300
Connection ~ 3250 2050
$Comp
L Device:C C21
U 1 1 5C532D36
P 1550 1000
F 0 "C21" H 1575 1100 50  0000 L CNN
F 1 ".47uF" H 1575 900 50  0000 L CNN
F 2 "" H 1588 850 50  0000 C CNN
F 3 "" H 1550 1000 50  0000 C CNN
	1    1550 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 5C532D3C
P 1200 1000
F 0 "C20" H 1225 1100 50  0000 L CNN
F 1 "22uF" H 1225 900 50  0000 L CNN
F 2 "" H 1238 850 50  0000 C CNN
F 3 "" H 1200 1000 50  0000 C CNN
	1    1200 1000
	1    0    0    -1  
$EndComp
Connection ~ 3050 1150
Connection ~ 3050 850 
$Comp
L power:PWR_FLAG #FLG035
U 1 1 5C5348E6
P 2950 2600
F 0 "#FLG035" H 2950 2695 50  0001 C CNN
F 1 "PWR_FLAG" H 2950 2780 50  0000 C CNN
F 2 "" H 2950 2600 50  0000 C CNN
F 3 "" H 2950 2600 50  0000 C CNN
	1    2950 2600
	1    0    0    -1  
$EndComp
Connection ~ 2950 2600
$Comp
L power:PWR_FLAG #FLG036
U 1 1 5C534995
P 950 850
F 0 "#FLG036" H 950 945 50  0001 C CNN
F 1 "PWR_FLAG" H 950 1030 50  0000 C CNN
F 2 "" H 950 850 50  0000 C CNN
F 3 "" H 950 850 50  0000 C CNN
	1    950  850 
	1    0    0    -1  
$EndComp
Connection ~ 950  850 
Connection ~ 2800 2800
Connection ~ 3600 2050
Connection ~ 2850 850 
$Comp
L Connector:TestPoint TP?
U 1 1 5D244D32
P 1200 850
F 0 "TP?" H 1258 968 50  0000 L CNN
F 1 "TestPoint" H 1258 877 50  0000 L CNN
F 2 "" H 1400 850 50  0001 C CNN
F 3 "~" H 1400 850 50  0001 C CNN
	1    1200 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D2450B6
P 2850 850
F 0 "TP?" H 2908 968 50  0000 L CNN
F 1 "TestPoint" H 2908 877 50  0000 L CNN
F 2 "" H 3050 850 50  0001 C CNN
F 3 "~" H 3050 850 50  0001 C CNN
	1    2850 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D2454BF
P 4400 850
F 0 "TP?" H 4458 968 50  0000 L CNN
F 1 "TestPoint" H 4458 877 50  0000 L CNN
F 2 "" H 4600 850 50  0001 C CNN
F 3 "~" H 4600 850 50  0001 C CNN
	1    4400 850 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D245994
P 3600 2050
F 0 "TP?" H 3658 2168 50  0000 L CNN
F 1 "TestPoint" H 3658 2077 50  0000 L CNN
F 2 "" H 3800 2050 50  0001 C CNN
F 3 "~" H 3800 2050 50  0001 C CNN
	1    3600 2050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5D245F67
P 2800 2800
F 0 "TP?" V 2995 2872 50  0000 C CNN
F 1 "TestPoint" V 2904 2872 50  0000 C CNN
F 2 "" H 3000 2800 50  0001 C CNN
F 3 "~" H 3000 2800 50  0001 C CNN
	1    2800 2800
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
