Class dc.aoc2021.Day2 Extends dc.aoc2021.Base
{

Parameter InputFile = "Day2.txt";

ClassMethod Run(verbose As %Integer = 0) As %Integer
{
    #dim stream as %Stream.FileCharacter
    set stream = ..GetInput(..#InputFile, .input)

    set (x, y) = 0
    while 'stream.AtEnd {
        set data = stream.ReadLine()
        if $piece(data, " ", 1) = "forward" { set x = $increment(x, $piece(data, " ", 2)) }
        if $piece(data, " ", 1) = "down" { set y = $increment(y, $piece(data, " ", 2)) }
        if $piece(data, " ", 1) = "up" { set y = y -$piece(data, " ", 2) }
    }
    return x * y
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream = ..GetInput(..#InputFile, .input)
    
    set (aim, x, y) = 0
    while 'stream.AtEnd {
        set data = stream.ReadLine()
        if ($piece(data, " ", 1) = "forward") { 
            set x = $increment(x, $piece(data, " ", 2))
            set y = y + (aim * $piece(data, " ", 2))
        } else {
            set aim = $select($piece(data," ", 1) = "down":aim + $piece(data, " ", 2), 1:aim - $piece(data, " ", 2))
        }
    }
    return x * y
}

}
