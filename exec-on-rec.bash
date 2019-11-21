#!/bin/bash

#p: complete path to the output directory into which the last DICOM object was stored (not available with option –ignore though)
#f: filename of the current output file (not available with option –ignore though)
#a: calling application entity title of the peer Storage SCU
#c: called application entity title used by the peer Storage SCU to address storescp
#r: calling presentation address, i.e. hostname or IP address of the peer Storage SCU

IN_P=$1
IN_F=$2
IN_A=$3
IN_C=$4
IN_R=$5

echo "exec-on-rec.bash:"
echo "-----------------"
echo "         P: $IN_P"
echo "         F: $IN_F"
echo "         A: $IN_A"
echo "         C: $IN_C"
echo "         R: $IN_R"
echo "RELAY_TYPE: $RELAY_TYPE"
echo " RELAY_AEC: $RELAY_AEC"
echo "RELAY_HOST: $RELAY_HOST"
echo "RELAY_PORT: $RELAY_PORT"

if [[ "${RELAY_TYPE}" == "NONE" ]]
then
    # Don't do anything.  Since the DICOM has already been saved to $IN_P/$IN_F, delete it
    rm -f $IN_P/$IN_F
    echo "DICOM has been received but not saved"
elif [[ "${RELAY_TYPE}" == "SAVE" ]]
then
    # Save the dicom to file.  Since this is already done, don't do anything
    echo "DICOM has been saved to $IN_P/$IN_F"
    continue
elif [[ "${RELAY_TYPE}" == "RELAY" ]]
then
    storescu -aec $RELAY_AEC $RELAY_HOST $RELAY_PORT $IN_P/$IN_F
    continue
else
    echo "Unknown RELAY_TYPE, assuming 'NONE'"
    # Don't do anything.  Since the DICOM has already been saved to $IN_P/$IN_F, delete it
    rm -f $IN_P/$IN_F
fi

