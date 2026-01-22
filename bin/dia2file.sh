#!/bin/bash

function calldia2file {
    if [ -z $1 ]; then
        echo "Usage: dia2file DIAFILE [OUTFILE]"
    elif [ ! -f $1 ]; then
        echo "Error: File $1 does not exists!"
    else
        ext=$(file-extension $1)
        bname=$(file-basename $1)
        burl=$(dia2base64 $1)
        oext=svg
        if [ ! -z $2 ]; then
            oext=$(file-extension $2)
            ofile=$2
        else
            ofile=${bname}.$oext        
        fi

        if [ "$ext" == "erd" ]; then
            url=https://kroki.io/erd/$oext/$burl
        elif [ "$ext" == "erd" ]; then
            url=https://kroki.io/graphviz/$oext/$burl
        elif [ "$ext" == "pml" ]; then         
            url=https://kroki.io/plantuml/$oext/$burl
        elif [ "$ext" == "puml" ]; then         
            url=https://kroki.io/plantuml/$oext/$burl
        else
            url=https://kroki.io/ditaa/$oext/$burl
        fi
        echo "fetching $(echo $url | cut -c 1-50) ..."
        wget -q $url -O $ofile
        echo "Sucess: Image saved in $ofile!"
    fi
}

function dia2base64 {
    cat $1 |  python3 -c "import sys; import base64; import zlib; print(base64.urlsafe_b64encode(zlib.compress(sys.stdin.read().encode('utf-8'),9)).decode('ascii'))" \
    echo -
}
function file-extension {
   filename=$(basename -- "$1")
   extension="${filename##*.}"
   echo $extension
}
function file-basename {
   filename=$(basename -- "$1")
   extension="${filename##*.}"
   basename=$(basename $filename .$extension)
   echo $basename

}
#filename="${filename%.*}"
calldia2file "$@"
