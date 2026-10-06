$Computers = (Get-Content computers.txt)
foreach ($c in $Computers) {
    .\audit.ps1 $c
} 
