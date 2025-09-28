#!bin/bash
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[optional, default 14 days] $N"
    exit 1
}

### Check SOURCE_DIR and DEST_DIR passed or not ####
if [ $# -lt 2 ]; then
    USAGE
fi

### Check SOURCE_DIR Exist ####
if [ ! -d $SOURCE_DIR ]; then
    echo -e "$R Source $SOURCE_DIR does not exist $N"
    exit 1
fi

### Check DEST_DIR Exist ####
if [ ! -d $DEST_DIR ]; then
    echo -e "$R Destination $DEST_DIR does not exist $N"
    exit 1
fi

### Find the files ####
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)


if [ ! -z "${FILES}" ]; then
    ### Start Archeiving ###
    echo "Files found: $FILES"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "Zip file name: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"

    ### Check Archieval Success or not ###
    if [ -f $ZIP_FILE_NAME ]
    then
        echo -e "Archeival ... $G SUCCESS $N"

        ### Delete if success ###
        while IFS= read -r filepath
        do
            echo "Deleting the file: $filepath"
            rm -rf $filepath
            echo "Deleted the file: $filepath"
        done <<< $FILES
    else
        echo "Archieval ... $R FAILURE $N"
        exit 1
    fi
else
    echo -e "No files to archeive ... $Y SKIPPING $N"
fi