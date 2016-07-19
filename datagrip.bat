@ECHO OFF
SET "dgFolder=%UserProfile%\.DataGrip2016.1"

SET "evilFile=%dgFolder%\config\eval\DataGrip2.evaluation.key"
SET "evilBakFile=%dgFolder%\config\eval\DataGrip2.evaluation.key.bak"

echo exorcising evil spirit in key
if exist "%evilFile%" (
	move /y "%evilFile%" "%evilBakFile%"
) else (
	echo no evil detected
)

SET "optionFolder=%dgFolder%\config\options
SET "optionFile=%optionFolder%\options.xml"
SET "optionFileBak=%optionFolder%\options.xml.bak"
echo;

echo exorcising evil spirit in options.xml
move /y "%optionFile%" "%optionFileBak%"
type "%optionFileBak%" | findstr /v evlsprt > "%optionFile%"

SET "registryPath=HKEY_CURRENT_USER\Software\JavaSoft\Prefs\jetbrains\datagrip"
echo;

echo exorcising evil spirit in registry
%SystemRoot%\system32\reg.exe delete %registryPath% /f

echo Evil Spirit is gone!
