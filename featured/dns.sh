apt-get install bind9 bind9utils bind9-doc
apt-get install libwww-perl

install_setting_bind9 () {
    sed -i 's/.*OPTIONS.*/OPTIONS="-u bind -4"/' /etc/default/bind9 

    echo "zone \"$domain\" {
	type master;
        file \"/etc/bind/db.$domain\";
};" > /etc/bind/named.conf.local

    cp /etc/bind/db.local /etc/bind/db.${domain}

    sed -i "s/localhost./${domain}\./g" ./db.${domain}
    sed -i "s/127.0.0.1/${ip}/g" ./db.${domain}
    sed -i "s|NS.*.|NS\tns1.${domain}\.|g" ./db.${domain}
    echo -e "ns1\tIN\tA\t${ip}" >> ./db.${domain}
}

service bind9 restart

connect_dnsmanager () {
    mkdir /root/dnsmgr
    curl -o /root/dnsmgr/dnsmgrupdate -ku: https://:@svn.deserv.net/dnsmgrupdate/dnsmgrupdate
    chmod +x /root/dnsmgr/dnsmgrupdate

    echo -e "NAMEDPATH=/etc/bind/db.$domain
MASTERIP=$IP
DNSMGRURL=https://dnsmgr1.server.net/manager/dnsmgr?out=text&authinfo=user:pass
DNSMGRURL=https://dnsmgr2.server.net/manager/dnsmgr?out=text&authinfo=user:pass
CHANGESONLY=yes
CHECKMASTER=yes" >> /root/dnsmgr/dnsmgrupdate.conf

    sed "/listen-on-v6 { any; };/ a\\
\tnotify explicit; \n\
\talso-notify { 74.119.194.67; 185.12.92.10; }; \n\
\tallow-transfer { 74.119.194.67; 185.12.92.10; }; \ " /etc/bind/named.conf.options > /tmp/named.conf.options

    cat /tmp/named.conf.options > /etc/bind/named.conf.options

}

