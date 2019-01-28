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
