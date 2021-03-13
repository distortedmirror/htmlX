#/bin/bash
export DISPLAY=:1
killall xdotool 2>/dev/null
 urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
read input
export input
#echo $input >> login.out
export uri="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@urlqs=split(/[\?]/);$url=$urlqs[0];print $url;'`"
export xm="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@url=split(/[\?]/);$_=$url[1];@qs=split(/[\&]/);$_=$qs[0];@nvp=split(/=/);print $nvp[1];'`"
export ym="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@url=split(/[\?]/);$_=$url[1];@qs=split(/[\&]/);$_=$qs[1];@nvp=split(/=/);print $nvp[1];'`"
export xt="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@url=split(/[\?]/);$_=$url[1];@qs=split(/[\&]/);$_=$qs[2];@nvp=split(/=/);print $nvp[1];'`"
export xk="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@url=split(/[\?]/);$_=$url[1];@qs=split(/[\&]/);$_=$qs[3];@nvp=split(/=/);print $nvp[1];'`"
export mo="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@url=split(/[\?]/);$_=$url[1];@qs=split(/[\&]/);$_=$qs[4];@nvp=split(/=/);print $nvp[1];'`"
if [ "$xt" != "" ];
then
xt=$(urldecode "$xt")
xdotool type "$xt"
sleep 1
./capture.sh
fi
export mb="`perl -e '$_=$ENV{\"input\"};@get=split(/ /);$_=$get[1];@url=split(/[\?]/);$_=$url[1];@qs=split(/[\&]/);$_=$qs[5];@nvp=split(/=/);print $nvp[1];'`"
if [ "$xk" != "" ];
then
xk="`perl -e '$_=$ENV{\"xk\"};s/PLUS/\+/g;print $_;'`"
xdotool key $xk
sleep 1
./capture.sh
fi
if [ "$xm" != "" ] &&  [ "$ym" != "" ];
then
xdotool mousemove $xm $ym $mo $mb
sleep 1
./capture.sh
fi
perl -e 'print "HTTP/1.1 200 OK\r\n"'
if [ "$uri" = "/" ];
then
	export uri=/screen.html
fi
export mime="`file --mime-type .$uri`"
export len="`cat .$uri|wc -c`"
perl -e '$_=$ENV{"mime"};@x=split(/ /);$len=$ENV{"len"};print "Content-Type: $x[1]\r\nContent-Length: $len\r\n\r\n"'
perl -e '$_=$ENV{"mime"};@x=split(/ /);$len=$ENV{"len"};print "Content-Type: $x[1]\r\nContent-Length: $len\r\n\r\n"' > logout.out
cat .$uri
