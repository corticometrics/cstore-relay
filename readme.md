# cstore-relay

Simply relay for DICOM C-STORE commands.  

It catches incomming C-STORE requests using xinetd (thanks to Paul Raines for showing me that trick) and either saves the incomming DICOM or executes another C-STORE to push it elsewhere.  Might eventually support annonimization before initiating the next C-STORE

Originally build to catch DICOMS from a Seimens MR scanner since pushing directly to orthanc generates an error.

## Build

`make`

## Run

The default incomming port inside the container is `12345`, map the port accordingly when launching the container.

The default outgoing port inside the container is `54321`, map the port accordingly when launching the container.

DICOMS that are saved, and log files are written to `/tmp` so map that directory accordingly when launching the container if you want to save them.

```
mkdir -p ${PWD}/tmp
docker run -it --rm \
  -v ${PWD}/tmp:/tmp \
  -p 12345:12345/tcp \
  -p 54321:54321/tcp
  cstore-relay
```

## Test

storescu -aec ORIBI_AREG 127.0.0.1 12345 file.dcm

## Acknowledgments

This work has been partially funded by the following NIH grants:
- R42CA183150
- R42AG062026



