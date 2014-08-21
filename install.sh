echo ""
echo "    .. .......=DDDNDNDNDI.    . ......  .                   "
echo "    ..   .78NNDDNDN7ONDDDDD, . .:8DDN87. .                  "
echo "     . IDDNDDDN.7D ..DNDNDDD,  DNDDDDDNN=                   "
echo "....ODDDNDDDDDDD~.  :NDNDDDDND.:DNDDDNNNDN.... . .           "
echo "...DDDDNDDDDDDNNNO.ZDDDNDDDDDDD. NDDNDDDDN7..... ...        "
echo ".DDDNDNNDDDDDDNDNDDNDDDNDDDDDNNN~.DDNDNNDDD78NDNNOI.        "
echo "DDNDDNDNDDDDDDDDDDDDDDDDDZDDDNNDN..DNDDDDDDDDDDDDNNDDD. .   "
echo "8IDDDDN?8DDDDDDDDDDDDDDDD.NNNDNNDI.+NDDDDDDDDDDDDNDDND7 .   "
echo "=NZ.,.7NDDDDDDDDDDDDDDDDO..NNNDDNN..DDDDDDDDDDDDDNNDNDN=.   "
echo ".NN?DDDNNDDDDDDDDDDDDNDD+..,DNNDND..DDDDDDDDDDDDDDDDNDD8.   "
echo ".7D?NNDNDDDDDDDDDDDDNDDN.I8..,NNN..NNNDDDDDDDDDDDDDDDNND=   "
echo "..+DNDNDDDDDDDDDDDDNDDD,.NDD:.... NNDNDDDDDDDDDDDDDDDND8.   "
echo "..7DDDDDDDDDNDNDDNDDND.  NDNDDDDDDNDNNDDDDDDDDDDDDDDDNN:. . "
echo " . .8DNDDDDNDDNDDDDDD..7NDNDDDDDDNNDDDDDDDDDDDDDDDDDNDD+... "
echo ". . ..=DNDNDDDDDND= .:NDDDNDDDDNNDDDNDDDDDDDDDDDDDDDNNDDN, ."
echo "      .  . . .....IDNDNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDN ."
echo "    . .  DDDNNNDNDDDDNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDO~"
echo "     . .INDDNDDDNNDDDDNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD?"
echo "    ... 8DDNNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDN8="
echo "    .. .?DDDNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD?."
echo "    .....,DNDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD ."
echo "         . .=NDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDNDDDDDNDNDDD7   "
echo "          . ~DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDNDDDDZNDDDDI..   "
echo "          . .DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDNDND ..   .     "
echo "              :NDNNDONNDDDDDDNNDNNDNNDDNDDNNDDD~            "
echo "              .......DDDDDDDNDDD7ZDNNNNDDDNDNI .            "
echo "                . ... ?DNDDNDN?~Z7..I8DN8Z~..  .            "
echo "                        .,,,,.8DI=DN:OZ?. .                 "
echo "                        . ~N=.DN~.NN.DN,.                   "
echo "                        ................                    "
echo "Ancient Sheep (www.ancientsheep.com)"
echo "AsiAds v0.1"
echo ""
echo ""


#remove all libs first
haxelib remove asiads

# clean all obj files first
rm -rf "project/obj"

#AsiAds
echo "Building AsiAds"
cd "project"
haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_CLANG -DOBJC_ARC
haxelib run hxcpp Build.xml -Diphoneos -DHXCPP_ARMV7 -DHXCPP_CLANG -DOBJC_ARC
haxelib run hxcpp Build.xml -Diphonesim -DHXCPP_CLANG -DOBJC_ARC

echo "Installing AsiAds"
cd "../";
rm -rf asiads.zip
zip -r asiads.zip asiads
haxelib local asiads.zip

echo "Finished installing AsiAds"