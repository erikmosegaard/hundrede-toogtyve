Function New-Password([int] $Length, [bool] $Complexity)
# ----------------------------------------------------------------------------------------------------------
# Kennwort generieren
# ----------------------------------------------------------------------------------------------------------
#
# Eingabe: 
#          Length     : Länge des Passwortes
#          Complexity : TRUE Wenn die erhöte Komplexität benötigt wird
#                       FALSE nur Kleinbuchstaben
#
# Änderungsnachweis:
# Datum      Wer  Was
# 01.01.2019 HES  Initial
# 14.01.2019 HES  Header hinzugefügt
# 14.01.2019 HES  Komplexität hinzugefügt
#
# ----------------------------------------------------------------------------------------------------------
{
    # Lokale Variablen deklarieren und initialisieren
    [String] $xPassword = ""
    [psObject] $xRandom = New-Object System.Random
    [Int] $xMin=0
    [Int] $xMax=0
    
    #Schleifenvriable
    [Int] $xi=0
    for($xi=0;$xi -lt $Length; $xi++){
        if ($Complexity){
            $complex = 4
        } else {
            $complex = 1
        }
        switch($xRandom.next(1,$complex))
        {
            1{
                #Kleinbuchstaben
                $xMin=97
                $xMax=123
            }
            2{
                #Grossbuchstaben
                $xMin=65
                $xMax=91
            }
            3{
                #Zahlen
                $xMin=48
                $xMax=58
            }
            default {
                #Falls Keine Option zutrifft
                #Kleinbuchstaben
                $xMin=97
                $xMax=123
            }

        }
        $xPassword = $xPassword +[char]$xRandom.next($xMin,$xMax)
        
    }

    #Rückgabewert
    return $xPassword
}