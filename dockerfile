FROM python:3.8-slim-buster

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y lib32z1 xinetd dcmtk

COPY ./relay.bash /relay.bash
COPY ./exec-on-rec.bash /exec-on-rec.bash
COPY ./etc--xinetd.conf /etc/xinetd.conf
COPY ./etc--services.conf /etc/services

ENV DCM_AET CSTORE_RELAY

# Possible values are:
#  - "NONE"
#    - Dont do anything (DICOM is saved then immediately deleted)
#  - "SAVE"
#    - Save the incomming DICOM 
#  - "RELAY"
#  - "RELAY+SAVE"
#  - "RELAY+DELETE"

ENV RELAY_TYPE SAVE
ENV RELAY_AEC DICOM_ORIBI
ENV RELAY_HOST localhost
ENV RELAY_PORT 54321

EXPOSE 12345
EXPOSE 54321

VOLUME /tmp

CMD ["/usr/sbin/xinetd", "-dontfork"]
