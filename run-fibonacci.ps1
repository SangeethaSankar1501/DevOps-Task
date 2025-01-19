param (
    [int]$Number
)
if ($null -ne $Number) {
    .\Fibonacci.ps1 -Number $Number
} else {
    .\Fibonacci.ps1
}
