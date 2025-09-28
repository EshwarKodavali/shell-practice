#!bin/bash
source=$1
Destination=$2
days=${3:-14}

if [ $# -lt 2 ]; then
    echo "minimum parameters are 2"
    exit 1
fi

if [ ! -d $source ]; then
    echo "source file not found"
    exit 1
fi

if [ ! -d $destination ]; then
    echo "source file not found"
    exit 1
fi

file=$(find $source -name "*.log" -type f -mtime +$days)

if [! -z ${file} ]; then
    echo "Log files exits"
    Timestamp=$(date +%F-%H-%M)
    zip_file_name="$DEST_DIR/app-logs-$Timestamp.zip"
    echo "Zip file name: $zip_file_name"
    find $source -name "*.log" -type f -mtime +$days | zip -@ -j "$zip_file_name"
    if [ -f $zip_file_name ]; then
        echo "zip file found"
        while IFS= read -r filepath
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $file
    else
        echo "zip file not found"
        exit 1
    fi
else
    echo "Log files not found"
fi