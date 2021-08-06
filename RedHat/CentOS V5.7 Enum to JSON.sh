#!/bin/bash
### This script is to automate host analysis by turning commands into JSON format to get implemented into splunk or kibana
### Used for Centos/Redhat/Linux boxes
#Gets Last Login Information
lastlog | grep-v "Never logged" | grep -v "From" | awk '
BEGIN { FS= ":"; ORS = ""; print " [ "}
{ printf "%s{\"Last Login\": \"%s\"}",
separator, $0
separator = ", "
}
END { print " ] } }';

#Gets Apache Version
apachectl -v | awk '
BEGIN { FS= "\"; ORS = ""; print " [ "}
{ printf "%s{\"Apache Version\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';

#Gets Default Route
route | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"Destination\": \"%s\", \"Gateway\": \"%s\", \"Genmask\": \"%s\"}",
separator, $1, $2, $3
separator = ", "
}
END { print " ] } }';
sleep 5

#Gets Environmental Variables
env | awk '
BEGIN { FS= "="; ORS = ""; print " [ "}
{ printf "%s{\"Environmental Variables\": \"%s\", \"Value\": \"%s\"}",
separator, $1, $2
separator = ", "
}
END { print " ] } }';

#Gets Group Info
cat /etc/group | awk '
BEGIN { FS= ":"; ORS = ""; print " [ "}
{ printf "%s{\"Name\": \"%s\", \"Group\": \"%s\"}",
separator, $1, $4
separator = ", "
}
END { print " ] } }';

#Gets Hostname
hostname | awk '
BEGIN { FS= "\"; ORS = ""; print " [ "}
{ printf "%s{\"Hostname\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';

#Gets Listening Connections on Netstat
netstat -ntlp | grep -v "only servers" | grep -v Recv-q | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"Protocol\": \"%s\", \"Source Address\": \"%s\", \"Destination Address\": \"%s\", \"Connection State\": \"%s\",  \"Command\": \"%s\"}",
separator, $1, $4, $5, $6, $7
separator = ", "
}
END { print " ] } }';

#Gets User Account Information(etc/passwd)
cat /etc/passwd | awk '
BEGIN { FS= ":"; ORS = ""; print " [ "}
{ printf "%s{\"Name\": \"%s\", \"Shell\": \"%s\"}",
separator, $1, $7
separator = ", "
}
END { print " ] } }';

#Gets Active Processes
ps -aux | | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"User\": \"%s\", \"Pid\": \"%s\", \"Command\": \"%s\"}",
separator, $1, $2, $(NF)
separator = ", "
}
END { print " ] } }';

#Gets Roots Bash History
cat /root/.bash_history | tail -n +25 | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"Root History Command\": \"%s\"}",
separator, $0
separator = ", "
}
END { print " ] } }';

#Gets SUID Bit
find / . -perm 4000 2>/dev/null| awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"Root History Command\": \"%s\"}",
separator, $0
separator = ", "
}
END { print " ] } }';
sleep 7

#Gets SGID Bit
find / . -perm 2000 2>/dev/null | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"SGID Bit Set\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';
sleep 7

#Gets Available Shells
cat /etc/shells | awk '
BEGIN { FS = ":" ;ORS = ""; print " [ "}
{ printf "%s{\"Available Shells\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';

#Gets Sudo Version
sudo -V | head -n 1 | awk '
BEGIN { FS = ":" ;ORS = ""; print " [ "}
{ printf "%s{\"Sudo Version\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';

#Gets Default Permissions
cat /etc/login.defs | grep "UMASK" | grep -v "default" | grep -v "Default" | grep -v "historical" | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"Default Permission\": \"%s\"}",
separator, $2
separator = ", "
}
END { print " ] } }';

#Gets System Info
uname -a | awk '
BEGIN { FS = ":" ;ORS = ""; print " [ "}
{ printf "%s{\"System Info\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';

#Gets SQL Version
mysql -V | awk '
BEGIN { FS = ":" ;ORS = ""; print " [ "}
{ printf "%s{\"SQL Version\": \"%s\"}",
separator, $1
separator = ", "
}
END { print " ] } }';

#Get User/System Binaries
find /bin /sbin /usr/bin /usr/sbin -type f 2>/dev/null | xargs md5sum 2>/dev/null | awk '
BEGIN { ORS = ""; print " [ "}
{ printf "%s{\"File\": \"%s\", \"MD5sum\": \"%s\"}",
separator, $2, $1
separator = ", "
}
END { print " ] } }';
