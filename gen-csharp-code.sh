#!/bin/bash
function ProgramGen
{
	echo "using System;"
	echo "using System.Text;"
	echo "namespace AsciiToHex"
	echo "{"
	echo "class MainClass"
	echo "{"
	FuncGen
	echo "public static void Main (string[] args)"
	echo "{"
	echo "string arg=String.Join(\" \",args);"
	echo "Console.WriteLine(\"Input: {0}\", args);"
	echo "Console.Write(\"Output: \");"
	echo "foreach(char c in arg)"
	echo "{"
	echo "	string S=Convert(c);"
	echo "	Console.Write(S);"
	echo "}"
	echo "Console.WriteLine();"
	echo "}"
	echo "}"
	echo "}"
}
function FuncGen
{
	echo "public static string Convert(char c)"
	echo "{"
	echo "string r = c.ToString();"
	echo "switch(c)"
	echo "{"

	for ((b = 0 ; b < 256 ; ++b))
	do
		ByteStr=$(printf "%03x" $b)
		CaseGen $ByteStr
	done

	echo "}"
	echo "return r;"
	echo "}"
}
function CaseGen
{
	Code="$1"
	echo "case '\x$Code':"
	echo "	r=\"\\\\x$Code\";"
	echo "	break;"
}
ProgramGen

