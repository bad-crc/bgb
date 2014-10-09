#!/bin/sh

out_file_name='dictionary_tmp.xml'


echo -n > $out_file_name



# dictionary.chillispot
wget -qO - http://dev.coova.org/svn/coova-chilli/doc/dictionary.chillispot | \
awk '/^VENDOR/, /^END-VENDOR/ {
    if ($1 == "VENDOR") {
        printf("<vendor name=""\"%s""\" code=""\"%s""\">\r\n", $2, $3);
    }
    if ($1 == "ATTRIBUTE" && $3 > 0) {
        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
    }
}' >> $out_file_name
echo '</vendor>' >> $out_file_name
echo -e "\r\n\r\n\r\n" >> $out_file_name



# dictionary.wispr
wget -q --no-check-certificate -O - https://raw.githubusercontent.com/FreeRADIUS/freeradius-server/master/share/dictionary.wispr | \
awk '/^VENDOR/, /^END-VENDOR/ {
    if ($1 == "VENDOR") {
        printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);
    }
    if ($1 == "ATTRIBUTE" && $3 > 0) {
        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
    }
}' >> $out_file_name
echo '</vendor>' >> $out_file_name
echo -e "\r\n\r\n\r\n" >> $out_file_name



# dictionary.mpd
mpd_version='mpd-5.7'
src_file_name="$mpd_version/conf/dictionary.mpd"
wget -qO - http://sourceforge.net/projects/mpd/files/latest/download | tar -zxf - $src_file_name
awk '/^VENDOR/, /^END-VENDOR/ {
    if ($1 == "VENDOR") {
        printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);
    }
    if ($1 == "ATTRIBUTE" && $3 > 0) {
        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
    }
}' $src_file_name >> $out_file_name
echo '</vendor>' >> $out_file_name
echo -e "\r\n\r\n\r\n" >> $out_file_name
rm -rf $mpd_version



# dictionary.mikrotik
wget -q --no-check-certificate -O - https://raw.githubusercontent.com/FreeRADIUS/freeradius-server/master/share/dictionary.mikrotik | \
awk '/^VENDOR/, /^END-VENDOR/ {
    if ($1 == "VENDOR") {
        printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);
    }
    if ($1 == "ATTRIBUTE" && $3 > 0) {
        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
    }
}' >> $out_file_name
echo '</vendor>' >> $out_file_name
echo -e "\r\n\r\n\r\n" >> $out_file_name



# dictionary.juniper
# этот словарь только для того, чтобы сохранить последовательность словарей в оригинальном dictionary.xml :)
#wget -q --no-check-certificate -O - https://raw.githubusercontent.com/FreeRADIUS/freeradius-server/master/share/dictionary.juniper | \
#awk '/^VENDOR/, /^END-VENDOR/ {
#    if ($1 == "VENDOR") {
#        printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);
#    }
#    if ($1 == "ATTRIBUTE" && $3 > 0) {
#        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
#    }
#}' >> $out_file_name
#echo '</vendor>' >> $out_file_name
#echo -e "\r\n\r\n\r\n" >> $out_file_name



# dictionary.redback
src_file_name='dictionary.redback'
wget -q --no-check-certificate https://raw.githubusercontent.com/FreeRADIUS/freeradius-server/master/share/dictionary.redback
awk '/^VENDOR/ {printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);}' $src_file_name >> $out_file_name
awk '/New names/, /VALUE/ {
    if ($1 == "ATTRIBUTE" && $3 > 0) {
        if ($5 == "has_tag") {
            if ($4 == "integer"){printf("\t<attribute name=""\"%s""\" tag=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, 1, $4, $3)}
            if ($4 == "string") {printf("\t<attribute name=""\"%s""\" tag=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, 2, $4, $3)}
        } else {
            if ($4 == "integer64") {
                printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, "octets", $3)
            } else {
                printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
            }
        }
    }
}' $src_file_name >> $out_file_name
echo '</vendor>' >> $out_file_name
echo -e "\r\n\r\n\r\n" >> $out_file_name
rm -rf $src_file_name



# dictionary.rfc4679
wget -q --no-check-certificate -O - https://raw.githubusercontent.com/FreeRADIUS/freeradius-server/master/share/dictionary.rfc4679 | \
awk '/^VENDOR/, /^END-VENDOR/ {
    if ($1 == "VENDOR") {
        printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);
    }
    if ($1 == "ATTRIBUTE" && $3 > 0) {
        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
    }
}' >> $out_file_name
echo '</vendor>' >> $out_file_name



# dictionary.dlink
#wget -q --no-check-certificate -O - https://raw.githubusercontent.com/FreeRADIUS/freeradius-server/master/share/dictionary.dlink | \
#awk '/^VENDOR/, /^END-VENDOR/ {
#    if ($1 == "VENDOR") {
#        printf("<vendor code=""\"%s""\" name=""\"%s""\">\r\n", $3, $2);
#    }
#    if ($1 == "ATTRIBUTE" && $3 > 0) {
#        printf("\t<attribute name=""\"%s""\" type=""\"%s""\" code=""\"%s""\" />\r\n", $2, $4, $3);
#    }
#}' >> $out_file_name
#echo '</vendor>' >> $out_file_name
