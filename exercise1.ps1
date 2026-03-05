Add-Type -AssemblyName System.Windows.Forms

$radius = 100
$steps  = 60
$delay  = 30

Write-Host "Exercise 1: cursor animation running. Press Ctrl+C to stop."
Write-Host "Moving in a circle (radius: $radius px)`n"

$origin = [System.Windows.Forms.Cursor]::Position
$i = 0

while ($true) {
    $angle = 2 * [Math]::PI * $i / $steps
    $x = [int]($origin.X + $radius * [Math]::Cos($angle))
    $y = [int]($origin.Y + $radius * [Math]::Sin($angle))
    [System.Windows.Forms.Cursor]::Position = [System.Drawing.Point]::new($x, $y)
    Start-Sleep -Milliseconds $delay
    $i = ($i + 1) % $steps

    if ($i -eq 0) {
        $time = Get-Date -Format "HH:mm:ss"
        Write-Host "[$time] Loop"
    }
}
