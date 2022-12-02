^!q::    ;Default hotkey is Ctrl+Alt+Q

omenHeight = 1080
omenWidth = 1920
viewSonicWidth = 2560
viewSonicHeight = 1440


activeWindow := WinActive("A")
if activeWindow = 0
{
    return
}
WinGet, minMax, MinMax, ahk_id %activeWindow%
if minMax = 1
{
    WinRestore, ahk_id %activeWindow%
}
WinGetPos, x, y, width, height, ahk_id %activeWindow%
if x < 0
{
    xScale := viewSonicWidth / omenWidth
    yScale := viewSonicHeight / omenHeight
    x := omenWidth + x
    newX := x * xScale
    newY := y * yScale
    newWidth := width * xScale
    newHeight := height * yScale
}
else
{
    xScale := omenWidth / viewSonicWidth
    yScale := omenHeight / viewSonicHeight
    newX := x * xScale
    newY := y * yScale
    newWidth := width * xScale
    newHeight := height * yScale
    newX := newX - omenWidth
}
WinMove, ahk_id %activeWindow%, , %newX%, %newY%, %newWidth%, %newHeight%
if minMax = 1
{
    WinMaximize, ahk_id %activeWindow%
}
WinActivate ahk_id %activeWindow%   ;Needed - otherwise another window may overlap it
return