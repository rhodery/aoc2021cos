Class dc.aoc2021.Day1 Extends dc.aoc2021.Base
{

Parameter InputFile = "input1.txt";

ClassMethod Run(verbose As %Integer = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    return 0
}

ClassMethod Run2(verbose = 0) As %Integer
{
    set stream=..GetInput(..#InputFile)
    set sum=0
	while 'stream.AtEnd {
		set line=stream.ReadLine()
        if verbose { write "line="_line," ","sum="_sum,! }
    }
    
    return sum
}

}
