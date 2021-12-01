Class dc.aoc2021.Base
{

Parameter Folder = "c:\temp\aoc\2021\";

ClassMethod GetInput(fn, ByRef inputArr) As %Stream
{
    //set inputArr = []
    set fn = ..#Folder_fn
    set stream = ##Class(%Stream.FileCharacter).%New()
    set sc = stream.LinkToFile(fn)
	while 'stream.AtEnd {
        //do inputArr.%Push(stream.ReadLine())
        set inputArr($i(inputArr)) = stream.ReadLine()
    }
    return stream
}

}
