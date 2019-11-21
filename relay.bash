#!/bin/bash

# Option –exec-on-reception allows one to execute a certain command line after having received and processed one DICOM object (through a C-STORE-RQ message). The command line to be executed is passed to this option as a parameter. The specified command line may contain a number of placeholders which will be replaced at run time:
#  - #p: complete path to the output directory into which the last DICOM object was stored (not available with option –ignore though)
#  - #f: filename of the current output file (not available with option –ignore though)
#  - #a: calling application entity title of the peer Storage SCU
#  - #c: called application entity title used by the peer Storage SCU to address storescp
#  - #r: calling presentation address, i.e. hostname or IP address of the peer Storage SCU

DATETIME=$(date '+%Y%m%d-%H%M%S');
LOG_XCR="cstore-relay-$DATETIME-xcr.log"
exec /usr/bin/storescp -id -aet ${DCM_AET} -od /tmp --promiscuous -xcr "/exec-on-rec.bash #p #f #a #c #r > /tmp/$LOG_XCR"
