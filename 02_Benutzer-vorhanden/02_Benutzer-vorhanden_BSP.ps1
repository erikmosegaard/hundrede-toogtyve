Function Test-User([String] $Username) {
    # ----------------------------------------------------------------------------------------------------------
    # Test ob User in der AD vorhanden
    # ----------------------------------------------------------------------------------------------------------
    #
    # Eingabe: 
    #          Username : String mit Benutzernamen
    #
    # Änderungsnachweis:
    # Datum      Wer  Was
    # 01.01.2019 HES  Initial
    #
    # ----------------------------------------------------------------------------------------------------------
    [bool] $xfound = $false #Lieber am Anfang deklarieren weil es schöner ist.

    $User = Get-ADUser -Filter {sAmAccountname -eq $Username}
    If ($User -ne $Null) {
        $xfound = $true <#2 Möglichkeit: [bool]$xfound = $true #>
    }
    else {
        $xfound = $false
    }
    return $xfound
}