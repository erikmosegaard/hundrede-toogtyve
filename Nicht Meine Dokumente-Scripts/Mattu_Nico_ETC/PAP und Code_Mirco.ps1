function New-Password([int]$pwlength, [boolean]$check) {
    for ($i = 0; $i -lt $pwlength; $i++) {
        [char[]]$CharArrayHard = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "(", ")", "[", "]", "{", "}", "?", "!", "$", "%", "&", "/", "=", "*", "+", "~", ",", ".", ";", ":", "<", ">", "-", "_");
        [char[]]$CharArrayEasy = @("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
        switch ($check) {
            true {[char[]]$list = $CharArrayHard; }
            false {[char[]]$list = $CharArrayEasy; }
        };
        [String]$String = $String + ( $list[(Get-Random -Maximum ($list).count)]);
    }
}