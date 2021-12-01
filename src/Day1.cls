Class dc.aoc2021.Day1 Extends dc.aoc2021.Base
{

Parameter InputFile = "day1.txt";

ClassMethod Run(verbose As %Integer = 0) As %Integer
{
    do ..GetInput(..#InputFile, .input)

    set x = $order(input(""))
    for { set x=$order(input(x)) quit:x=""
        if input(x) > input(x-1) { set total = $increment(total) }
    }
    return total
}

ClassMethod Run2(verbose = 0) As %Integer
{
    do ..GetInput(..#InputFile, .input)
    
    set y = 1
    set (sum, done) = 0
    set (depths, x) = ""
    for { set x=$order(input(x)) quit:x=""!'$data(input(x+2))
        set depths(y) = input(x) + input(x+1) + input(x+2)
        set y = $increment(y)
    }

    set total = 0
    set x=$order(depths(""))
    for { set x=$order(depths(x)) quit:x=""
        if depths(x) > depths(x-1) { set total = $increment(total) }
    }
    return total
}

}
