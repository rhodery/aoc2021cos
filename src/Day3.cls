Class dc.aoc2021.Day3 Extends dc.aoc2021.Base
{

Parameter InputFile = "Day3.txt";

ClassMethod Run(verbose As %Integer = 0) As %Integer
{
    do ..GetInput(..#InputFile,.input)
    do ..GetBinStrings(.input,.gamma,.epsilon)
    write "gamma = "_gamma_", "_..bin2dec(gamma),!
    write "epsilon = "_epsilon_", "_..bin2dec(epsilon),!
    return (..bin2dec(gamma) * ..bin2dec(epsilon))
}

ClassMethod Run2(verbose = 0) As %Integer
{
    do ..GetInput(..#InputFile, .input)
    do ..GetBinStrings(.input,.o2,.co2)
    merge input2 = input
    do ..CheckBin(o2, .input, 1, 1)
    set o2 = input
    do ..CheckBin(co2, .input2, 1, 0)
    set co2 = input2
    write "O2 = "_o2_" ("_..bin2dec(o2)_")",!
    write "CO2 = "_co2_" ("_..bin2dec(co2)_")",!
    //write "life support = "_(..bin2dec(o2) * ..bin2dec(co2))

    return (..bin2dec(o2) * ..bin2dec(co2))
}

ClassMethod GetBinStrings(ByRef input, ByRef binStr1, ByRef binStr2) [ ProcedureBlock = 1 ]
{
    set cnt = 0
    set bin = ""
    for { set bin=$order(input(bin))
        quit:bin=""
        if cnt = 0 { set cnt = $length(input(bin)) }
        for x=1:1:$length(input(bin)) {
            if $extract(input(bin),x) = 1 { set ones(x) = $increment(ones(x)) }
            if $extract(input(bin),x) = 0 { set zeroes(x) = $increment(zeroes(x)) }
        }
    }

    set (binStr1, binStr2) = ""
    set pos = ""
    for pos=1:1:cnt {
        //for { set pos=$order(ones(pos))
        //quit:pos=""
        if +$get(ones(pos)) >= +$get(zeroes(pos)) { 
            set binStr1 = binStr1_1
            set binStr2 = binStr2_0
        } else { 
            set binStr1 = binStr1_0
            set binStr2 = binStr2_1
        }
    }
}

ClassMethod CheckBin(binary, ByRef binArr, ByRef pos, type)
{
    set bin = ""
    for { set bin=$order(binArr(bin))
        quit:bin=""
        if $extract(binArr(bin), pos) '= $extract(binary,pos) {
            kill binArr(bin)
            set binArr = binArr - 1
        }
    }
    if binArr = 1 { 
        set binArr = binArr($order(binArr("")))
    } else {
        do ..GetBinStrings(.binArr, .binary, .binary2)
        if type = 0 set binary = binary2
        do ..CheckBin(binary, .binArr, pos+1, type)
    }
    return
}

ClassMethod bin2dec(bin) [ ProcedureBlock = 1 ]
{
    s res=0 f i=1:1:$l(bin) { s res=res*2+$e(bin,i) } q res
}

}
