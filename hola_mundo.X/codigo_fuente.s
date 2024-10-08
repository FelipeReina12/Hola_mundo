; PIC18F4550 Configuration Bit Settings

; Assembly source line config statements

; CONFIG1L
  CONFIG  PLLDIV = 1            ; PLL Prescaler Selection bits (No prescale (4 MHz oscillator input drives PLL directly))
  CONFIG  CPUDIV = OSC1_PLL2    ; System Clock Postscaler Selection bits ([Primary Oscillator Src: /1][96 MHz PLL Src: /2])
  CONFIG  USBDIV = 1            ; USB Clock Selection bit (used in Full-Speed USB mode only; UCFG:FSEN = 1) (USB clock source comes directly from the primary oscillator block with no postscale)

; CONFIG1H
  CONFIG  FOSC = INTOSC_EC      ; Oscillator Selection bits (Internal oscillator, CLKO function on RA6, EC used by USB (INTCKO))
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  BOR = ON              ; Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
  CONFIG  BORV = 3              ; Brown-out Reset Voltage bits (Minimum setting 2.05V)
  CONFIG  VREGEN = OFF          ; USB Voltage Regulator Enable bit (USB voltage regulator disabled)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  CONFIG  CCP2MX = ON           ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG  PBADEN = ON           ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as analog input channels on Reset)
  CONFIG  LPT1OSC = OFF         ; Low-Power Timer 1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG  MCLRE = ON            ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
  CONFIG  ICPRT = OFF           ; Dedicated In-Circuit Debug/Programming Port (ICPORT) Enable bit (ICPORT disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000800-001FFFh) is not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) is not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) is not code-protected)
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) is not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) is not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM is not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) is not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) is not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) is not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) is not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) are not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) is not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM is not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) is not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) is not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) is not protected from table reads executed in other blocks)
#include <xc.inc>
// config statements should precede project file includes.
  psect   MARY,class=CODE,reloc=2 ; PIC18

inicio:
    ; Configuraci�n del oscilador (8 MHz INTOSC_EC)
    MOVLW   0x72        ; Configura el oscilador interno para 8 MHz
    MOVWF   OSCCON      ; Carga el valor en OSCCON

    ; Inicializaci�n de PORTB
    CLRF    TRISB       ; Configura todos los pines de PORTB como salida (TRISB = 0x00)

LOOP:
    ; Mostrar 'J' en PORTB
    MOVLW   00000000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo

    ; Mostrar 'J' en PORTB
    MOVLW   192        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo
    
        ; Mostrar 'J' en PORTB
    MOVLW   224        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo
    
        ; Mostrar 'J' en PORTB
    MOVLW   11110000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo
    
    MOVLW   11111000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo

    ; Mostrar 'J' en PORTB
    MOVLW   11111100B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo
    
        ; Mostrar 'J' en PORTB
    MOVLW   11111110B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo
    
        ; Mostrar 'J' en PORTB
    MOVLW   11111111B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
    
    
    MOVLW   11111110B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
    
    
    MOVLW   11111100B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo   
    
    MOVLW   11111000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
    
    
    MOVLW   11110000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
    
    
    MOVLW   11100000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
    
    MOVLW   11000000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo 
    
    
    MOVLW   10000000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
    
    
    MOVLW   00000000B        ; Carga el valor ASCII de 'J' (4Ah) en el registro W
    MOVWF   LATB        ; Env�a el valor del registro W a LATB
    CALL    Delay1s     ; Llama a la subrutina de retardo    
; Subrutina de retardo de 1 segundo ajustada para un oscilador de 8 MHz
Delay1s:
    MOVLW   50       ; Carga el valor reducido para Count1
    MOVWF   Count1      ; Almacena en el primer contador

Delay1Loop1:
    MOVLW   49      ; Carga el valor medio reducido
    MOVWF   Count2      ; Almacena en el segundo contador

Delay1Loop2:
    MOVLW   48      ; Carga el valor bajo reducido
    MOVWF   Count3      ; Almacena en el tercer contador

Delay1Loop3:
    NOP                 ; No operation (consume 1 ciclo)
    DECFSZ  Count3, 1   ; Decrementa Count3 y salta si llega a 0
    GOTO    Delay1Loop3
    DECFSZ  Count2, 1   ; Decrementa Count2 y salta si llega a 0
    GOTO    Delay1Loop2
    DECFSZ  Count1, 1   ; Decrementa Count1 y salta si llega a 0
    GOTO    Delay1Loop1

    RETURN              ; Retorna de la subrutina

; Variables de retardo (direcciones de memoria)
Count1      EQU     0x15
Count2      EQU     0x16
Count3      EQU     0x17

; Fin de la secci�n de c�digo
END