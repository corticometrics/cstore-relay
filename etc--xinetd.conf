# Simple configuration file for xinetd
#
# Some defaults, and one service

defaults
{

# Please note that you need a log_type line to be able to use log_on_success
# and log_on_failure. The default is the following :
# log_type = SYSLOG daemon info

}

service dicom_oribi
{
     socket_type         = stream
     wait                = no
     user                = root
     group               = root
     log_on_success      = HOST DURATION
     log_on_failure      = HOST
     server              = /relay.bash
     disable             = no
     port                = 12345
}

