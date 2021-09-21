$Computers = (Get-Content computers.txt)
foreach ($c in $Computers) {
    .\Audit.ps1 $c
} 
