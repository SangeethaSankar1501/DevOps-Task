param (
    [int]$Number
)
function Get-Fibonacci {
    param ([int]$n)
    $a = 0
    $b = 1
    for ($i = 0; $i -lt $n; $i++) {
        $temp = $a
        $a = $b
        $b = $temp + $b
    }
    return $a
}
if ($null -ne $Number) {
    Write-Output (Get-Fibonacci -n $Number)
} else {
    $counter = 0
    while ($true) {
        Write-Output (Get-Fibonacci -n $counter)
        Start-Sleep -Seconds 0.5
        $counter++
    }
}
