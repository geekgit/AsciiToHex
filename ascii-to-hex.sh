#!/bin/bash
Arg="$@"
SourceName="Program-$(uuidgen).cs"
ProgramName="converter-$(uuidgen)"
echo "[Gen] Source: $SourceName"
echo "[Gen] Binary: $ProgramName"
./gen-csharp-code.sh > $SourceName
mono-csc /define:RELEASE /optimize /out:$ProgramName $SourceName
./$ProgramName "$@"
echo "[Gen] Delete $SourceName..."
rm $SourceName
echo "[Gen] Delete $ProgramName..."
rm $ProgramName
