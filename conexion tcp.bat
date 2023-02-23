@echo off&cd adb&color 2
TITLE INICIAR CONECCION TCP BY JOSEPH NC
MODE con:cols=94 lines=20

:inicio
SET var=0
cls                                                                             
call :c 5 "INICIAR CONEXION TCP BY JOSEPH NC"
echo.
echo.
echo ================================
echo ^|^|^|^|^|^|^| 1: INICIAR ^|^|^|^|^|^|^|^|^|^|^|^|^|
echo ^|^|^|^|^|^|^| 2: INFO    ^|^|^|^|^|^|^|^|^|^|^|^|^|
echo ^|^|^|^|^|^|^| 3: DESCARGAR REDIRECTOR^|
echo ================================
echo.
echo.
SET /p var= ^> Seleccione una opcion [NUMERO]:
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
echo. El numero "%var%" no es una opcion valida, por favor intente de nuevo.
echo.
pause
echo.
goto:inicio

:op1
	set "iniciarconexión=starttcp"
	set "ayuda=readme"
	IF EXIST C:\ngrok.exe (goto starttcp) else (goto readme)
	echo.
		:starttcp 
		cd C:\
		ngrok tcp 32038
goto:inicio		
	:readme
	start READMESTARTTCP.txt
	start https://ngrok.com/download
	echo.
	call :c 0A "NO SE A ENCONTRADO NGROK EN SU EQUIPO"
	echo.
	echo.
	call :c 0E "SEGUIR LOS PASOS DEL TXT Y VOLVER A INTENTAR" 
    echo. 
    pause
goto:inicio	

:op2 
	echo.
	call :c 5 "LA CONEXION TCP EN ESTE CASO"    
	echo.
	call :c 5 "SE UTILIZA PARA PODER HACER REMOTOS "
    echo.
    call :c 5 "CON USB REDIRECTOR TECHNICIAN, "
    echo.
    call :c 5 "PARA SABER UN POCO MAS DE COMO UTILIZARLO "
    echo.
    call :c 5 "LEE EL TXT QUE SE ABRIO." 
	echo.
    CALL READMESTARTTCP.txt
    pause
goto:inicio
 
:op3	
	echo.
    SET /p varSN= ^> DESEAS DESCARGAR USB REDIRECTOR CLIENTE O SERVER? [C]/[S]: 
		if "%varSN%"=="C" goto cliente
		if "%varSN%"=="c" goto cliente
		if "%varSN%"=="S" goto server
		if "%varSN%"=="s" goto server


	:cliente
	start https://www.mediafire.com/file/46untk8nayt8jub/USB_REDIRECTOR_CLIENTE.zip/file
	pause
	goto:inicio
	:server	
	start https://www.mediafire.com/file/crjonrwzk6odxg7/usbredirector_server.zip/file
	pause
	goto:inicio
:c
setlocal enableDelayedExpansion


:colorPrint Color  Str  [/n]
setlocal
set "s=%~2"
call :colorPrintVar %1 s %3
exit /b

:colorPrintVar  Color  StrVar  [/n]
if not defined DEL call :initColorPrint
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
:: The single blank line within the following IN() clause is critical - DO NOT REMOVE
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b


:initColorPrint
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b


:cleanupColorPrint
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b

:salir
    @cls&exit
