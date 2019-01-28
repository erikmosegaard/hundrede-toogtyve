################################################################################################################################
#                                                         #   #       #       #       #       #      #       #      #       ####
#                            DAY1                         #     #   #   #   #   #   #   #   #   #   #  #   #   #   #  #   #   ##
#                                                         #       #       #       #       #       #      #       #      #      #
################################################################################################################################
#Passwortgenerierung
################################################################################################################################

clear

d:

##Gibt alle Verbe zurück
#Get-Verb

#Gibt alle Prozesse zurück 
Get-Process

#CPU Descending 
Get-Process |Sort-Object -Property cpu -Descending

#Vor dem Aktivieren und deaktivieren.
Get-Service XblGameSave

#Service Starten und Stopen.
Start-Service XblGameSave

#Stop Service
Stop-Service XblGameSave

#Nach dem dem Aktivieren und deaktivieren.
Get-Service XblGameSave


#Als Liste ausgeben
Get-Service | Format-List

#Standartmässig meistens die ausgabe!
Get-Service | Format-Table 

#
#Get-ChildItem
Get-ChildItem -Path d:\ -Recurse | Where {$_.Length -gt 20000} | Sort-Object Lengt -Descending | Format-List

# | dann 
#Auf der neuen Zeile weiter fahren...
##BSP:
#Get-ChildItem
Get-ChildItem -Path d:\ -Recurse | Where {$_.Length -gt 20000} | Sort-Object Lengt -Descending |
Format-List

#Die Meisten Commands haben Aliase
##Command
Get-ChildItem

##shortcut alias
dir


####### WIKI Auftrag #########

#Einfacher Befehl
#Prozess wird gerade dem Out-Grid View zugewiesen.
Get-Process | Out-GridView -Title "Get-Process mit edem Grid View"

#Mit einer Variabele den Output der Out-GridView zuweisen.
##Hier wird der Get-Process Befehl im Objekt $P Variable gespeichert.
$P = Get-Process 

##Hier wird der befehl mit dem pipline operator der Out-GridView der $P Variable gesendet.
$P | Out-GridView -Title "Variable P mit Grid View"

#das Cmdlet Get-Process wird verwendet 
##Mithilfe dem Property Parameter des Select-Object auswählen was angezeigt werden soll.
##Dannach wird das Ganze zum nächsten Pipline gesendet dem Sort-Object welche sie sortiert nach ausgewähltem objektnamen.
##Zum Schluss wirds mit der Pipeline zur Out-GridView gesendet
Get-Process | Select-Object -Property Name, WorkingSet, PeakWorkingSet | Sort-Object -Property WorkingSet -Descending | Out-GridView

#Zwischenablage ausgeben
Get-Clipboard

#History der Behefhle Ausgeben.
##Out-GridView ist für eine Grafische Oberfläche da (zuständig..)
Get-History | Out-GridView -Title "History mit Grid View"


#
##Passwort Generator
#
Function NEWPassword([int]$pwlength, [boolean]$check_PW) {
    for ($i = 0; $i -lt $array.Count; $i++) {
        [char[]]$CharArrayHard = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "(", ")", "[", "]", "{", "}", "?", "!", "$", "%", "&", "/", "=", "*", "+", "~", ",", ".", ";", ":", "<", ">", "-", "_");
        [char[]]$CharArrayEasy = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
        switch ($check_PW) {
            true {[char[]]$list = $CharArrayHard; }
            true {[char[]]$list = $CharArrayEasy; }
        };
        [string]$string = $string + ($list[(Get-Random -Maximum ($list).Count)])
    }
    Write-Host $string
}


################################################################################################################################
#                                                         #   #       #       #       #       #      #       #      #       ####
#                            DAY2                         #     #   #   #   #   #   #   #   #   #   #  #   #   #   #  #   #   ##
#                                                         #       #       #       #       #       #      #       #      #      #
################################################################################################################################
#Benutzer vorhanden?
################################################################################################################################


###########################
#     Aussgabe ADUser     #
###########################
Get-ADUser -Filter * | Out-GridView -Title "ADUser Grid View"


###########################
#  Users in AD Listen     #
###########################
##Zählt die USers in der AD
# Bessere Version.
Import-Module ActiveDirectory
function ExistUser([String] $username){
    [Boolean]$check = Get-ADUser -Filter 'Name' -Like 'username'
    Write-Output $check
}
#Funktion ExistUser Aufrufen
ExistUser


###########################
#  Users in AD Listen     #
###########################
##Zählt die Users
#
Import-Module ActiveDirectory
function ADUser {
    $users = Get-ADUser -Filter * | measure
    $users.Count
}
#Funktion Aufrufen
ADUser





################################################################################################################################
#                                                         #   #       #       #       #       #      #       #      #       ####
#                            DAY3                         #     #   #   #   #   #   #   #   #   #   #  #   #   #   #  #   #   ##
#                                                         #       #       #       #       #       #      #       #      #      #
################################################################################################################################
#OU erstellen
################################################################################################################################


