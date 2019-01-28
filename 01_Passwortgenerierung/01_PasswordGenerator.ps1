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

<#
#
##Password Generator WEB
#

#Funktion
function Get-RandomCharacters($length, $characters) {
$random = 1..$length | ForEach-Object { Get-Random -Maximum $characters.length }
$private:ofs = ""
return [String]$characters[$random]
}

#Funktion
function GeneratedStrs ([string]$inputString) {     
$characterArray = $inputString.ToCharArray()   
$scrambledStringArray = $characterArray | Get-Random -Count $characterArray.Length     
$outputString = -join $scrambledStringArray
return $outputString 
}

#Password Anforderung!
$password = Get-RandomCharacters -length 5 -characters 'abcdefghiklmnoprstuvwxyz'
$password += Get-RandomCharacters -length 1 -characters 'ABCDEFGHKLMNOPRSTUVWXYZ'
$password += Get-RandomCharacters -length 1 -characters '1234567890'
$password += Get-RandomCharacters -length 1 -characters '!"§$%&/()=?}][{@#*+'



Write-Host $password

$password = GeneratedStrs $password

Write-Host $password
#>