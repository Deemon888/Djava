#!/bin/bash

# when u type set in my script this is what bash says vvv

_=opt4
autoclear=on
autoclear2=off
autodebug=on
autodebugcmdscript=off
automakecommand=off
ccmd=set
dice=([0]="1" [1]="2" [2]="3" [3]="4" [4]="5" [5]="6" [6]="7" [7]="8" [8]="9" [9]="10" [10]="11" [11]="12" [12]="13" [13]="14" [14]="15" [15]="16" [16]="17" [17]="18" [18]="19" [19]="20" [20]="21")
i=100
localhost=127.0.0.1
morenumbersfordicerole=on
opt=
opt2=
opt3=
opt4=
pick=21
pwd=/home/deemon
random=14
randomize=5
shebang='#!/bin/bash'
smallsleep=on
tord=truth # <<< dont mind this
tru=([0]="0" [1]="1" [2]="2" [3]="3" [4]="4" [5]="5" [6]="6")
yn=n
.help () 
{ 
    echo -e "Here are some commands u can use\n\n       say  - repeat\n instr - input string\n  show.instr - show string";
    echo -e "   use.instr - use the string\n    c - clear";
    echo -e "   \n      # vv host and nmap stuff vv #\n\n       myhost - shows your hostname and (your) hostnames ip";
    echo -e "   vuln.myhost - checks your host for vulns (by localhost ip : $localhost)\n       set.tar - set target ip/host";
    echo -e "   vuln.tarip - check target ip/host for vulns";
    echo -e "\n # vv password and hash vv #\n\n autohash0 - md5 hasher\n        autohash1 - sha1 hasher";
    echo -e "   hashcatAV - hashcat auto version\n      (more soon)...";
    echo -e "\n # vv arps vv #\n\n      arp.interface - set the interface to listen on\n        arp.tar1 - set target 1 to arp";
    echo -e "   arp.tar2 - set target 2 to arp\n        Barp - run arp attack";
    echo -e "\n # vv show vars vv #\n\n show.arp - show arp vars\n      show.tar - show target host\n   show.exvar - show all option vars";
    echo -e "\n # vv fun stuff vv #\n\n cacu - x + y = z\n      cacu.CMA - checks if answer matches the cacu answer";
    echo -e "   show.cacu - shows cacu answer\n spam - time to spam\n   spam.cmd - spam time... but a command";
    echo -e "   dice - roll your dice\n tord - truth or dare\n\a"
}
69 () 
{ 
    yes 69
}
Barp () 
{ 
    if [[ $autoclear == "on" ]]; then
        clear;
    fi;
    sudo ettercap -T -S -i $interface -M arp:remote /$arptar1// /$arptar2//
}
arp.interface () 
{ 
    interface=wlan0;
    read interface;
    if [[ $interface == "" ]]; then
        interface=wlan0;
    fi
}
arp.tar1 () 
{ 
    if [[ -z $opt ]]; then
        read -e -r arptar1;
    else
        arptar1=$opt;
    fi
}
arp.tar2 () 
{ 
    if [[ -z $opt ]]; then
        read -e -r arptar2;
    else
        arptar2=$opt;
    fi
}
autohash0 () 
{ 
    if [[ -n $opt ]]; then
        echo "$opt" | md5sum;
    else
        read -e -r -p "> " md5;
        echo "$md5" | md5sum;
    fi
}
autohash1 () 
{ 
    if [[ -n $opt ]]; then
        echo "$opt" | sha1sum;
    else
        read -e -r -p ">" sha1;
        echo "$sha1" | sha1sum;
    fi
}
c () 
{ 
    clear
}
cacu () 
{ 
    A=$((opt "$opt2" $opt3));
    echo "$opt $opt2 $opt3 = $A"
}
cacu.CMA () 
{ 
    see=$((opt "$opt2" $opt3));
    if [[ $see != "$A" ]]; then
        echo -e "\nthe answer did not match :\n\n       $see does not match $A\n\a";
    else
        echo -e "The answer is correct!\n\n     $see matches $A\n\a";
    fi
}
dice () 
{ 
    dice[0]="1";
    dice[1]="2";
    dice[2]="3";
    dice[3]="4";
    dice[4]="5";
    dice[5]="6";
    if [[ $morenumbersfordicerole == "on" ]]; then
        dice[6]="7";
        dice[7]="8";
        dice[8]="9";
        dice[9]="10";
        dice[10]="11";
        dice[11]="12";
        dice[12]="13";
        dice[13]="14";
        dice[14]="15";
        dice[15]="16";
        dice[16]="17";
        dice[17]="18";
        dice[18]="19";
        dice[19]="20";
        dice[20]="21";
    fi;
    pick=${#dice[@]};
    random=$(($RANDOM % $pick));
    echo "Your dice rolled a ${dice[random]}"
}
hashcatAV () 
{ 
    if [[ $autoclear2 == "on" ]]; then
        clear;
    fi;
    read -r -e -p "input attack mode > " atkm;
    echo "";
    read -e -r -p "input hash type > " htype;
    echo "";
    read -e -r -p "input password list (file) > " pfile;
    echo "";
    read -e -r -p "input hash (or hash file) > " hfile;
    echo "ALRIGHT...";
    sleep 1;
    if [[ $autoclear == "on" ]]; then
        clear;
    fi;
    sudo hashcat -a $atkm -m $htype "$hfile" $pfile
}
instr () 
{ 
    read -r -e var1
}
myhost () 
{ 
    host $HOSTNAME
}
say () 
{ 
    echo "$opt"
}
set.tar () 
{ 
    if [[ $opt == "" ]]; then
        read -r -e targethost;
    else
        targethost=$opt;
    fi
}
show.arp () 
{ 
    echo """
        arp target 1 : $arptar1
        arp target 2 : $arptar2
        interface : $interface
        """
}
show.cacu () 
{ 
    if [[ -z $A ]]; then
        echo "there is no input";
    else
        echo "$A";
    fi
}
show.exvar () 
{ 
    if [[ $autoclear2 == "on" ]]; then
        clear;
    fi;
    echo -e "\n shebang : $shebang";
    echo -e "   autoclear : $autoclear";
    echo -e "   autoclear2 : $autoclear2";
    echo -e "   autodebug : $autodebug";
    echo -e "   autodebugcmdscript : $autodebugcmdscript";
    echo -e "   automakecommand : $automakecommand";
    echo -e "   command file path : $FILE";
    echo -e "   pwd : $pwd\n\a";
    echo -e "   # vv for fun stuff vv #\n";
    echo -e "   morenumbersfordicerole : $morenumbersfordicerole\n"
}
show.instr () 
{ 
    echo "$var1"
}
show.tar () 
{ 
    echo -e "target : $targethost"
}
spam () 
{ 
    if [[ -z $opt ]]; then
        echo "what do you want me to spam?";
    else
        if [[ $autoclear2 == "on" ]]; then
            clear;
        fi;
        i="$opt";
        for i in {1..100};
        do
            if [[ $smallsleep == "on" ]]; then
                sleep 0.05;
            fi;
            echo "$opt";
        done;
    fi
}
spam.cmd () 
{ 
    if [[ -z $opt ]]; then
        echo "what commands do you want me to spam?";
    else
        if [[ $autoclear2 == "on" ]]; then
            clear;
        fi;
        i="$opt";
        for i in {1..100};
        do
            if [[ $smallsleep == "on" ]]; then
                sleep 0.05;
            fi;
            if [[ -n $opt ]]; then
                $opt;
            fi;
            if [[ -n $opt2 ]]; then
                $opt $opt2;
            fi;
            if [[ -n $opt3 ]]; then
                $opt $opt2 $opt3;
            fi;
            if [[ -n $opt4 ]]; then
                $opt $opt2 $opt3 $opt4;
            fi;
        done;
    fi
}
tord () 
{ 
    echo "";
    read -r -e -p "truth or dare > " tord;
    if [[ $tord == "t" ]]; then
        tord=truth;
    else
        if [[ $tord == "d" ]]; then
            tord=dare;
        fi;
    fi;
    if [[ $tord == "truth" ]]; then
        tru[0]="0";
        tru[1]="1";
        tru[2]="2";
        tru[3]="3";
        tru[4]="4";
        tru[5]="5";
        tru[6]="6";
        pick=${#tru[@]};
        randomize=$(($RANDOM % $pick));
    fi;
    if [[ $tord == "dare" ]]; then
        d[0]="0";
        d[1]="1";
        d[2]="2";
        d[3]="3";
        d[4]="4";
        d[5]="5";
        d[6]="6";
        pick=${#d[@]};
        randomiz=$(($RANDOM % $pick));
    fi;
    if [[ ${tru[randomize]} == "0" ]]; then
        read -e -r -p "have you ever made a script before? y/n > " yn;
        if [[ $yn == "y" ]]; then
            echo -e "\n nice \n";
        else
            if [[ $yn == "n" ]]; then
                echo -e "\n its all good \n";
            fi;
        fi;
    else
        if [[ ${tru[randomize]} == "1" ]]; then
            read -e -r -p "have u used cacu while runnign this script rn? y/n > " yn;
            if [[ -z $A ]]; then
                if [[ $yn == "y" ]]; then
                    echo -e "\n LIES...";
                    sleep 2;
                    yes "y u lie";
                else
                    echo -e "\n oof \n";
                    sleep 1;
                fi;
            else
                if [[ $yn == "y" ]]; then
                    echo -e "\n ya its a nice command...ofc u would :)\n";
                else
                    if [[ $yn == "n" ]]; then
                        echo -e "\n u should try it \n";
                    else
                        echo -e "\n pick an opt next time \n";
                    fi;
                fi;
            fi;
        else
            if [[ ${tru[randomize]} == "2" ]]; then
                read -e -r -p "Do you like this script? y/n > " yn;
                if [[ $yn == "y" ]]; then
                    echo -e "\n thx u <|:) \n";
                else
                    if [[ $yn == "n" ]]; then
                        echo -e "\n that sucks \n";
                    else
                        echo -e "\n pick y or n next time... \n";
                    fi;
                fi;
            else
                if [[ ${tru[randomize]} == "3" ]]; then
                    read -e -r -p "have u ever just started looking at nothing for no reason? y/n > " yn;
                    if [[ $yn == "y" ]]; then
                        echo -e "\n weird right? \n";
                    else
                        if [[ $yn == "n" ]]; then
                            echo -e "\n ...alright \n";
                        else
                            echo -e "pick y or n next time";
                        fi;
                    fi;
                else
                    if [[ ${tru[randomize]} == "4" ]]; then
                        read -e -r -p "have you ever had a dream...that um..um u had? y/n > " yn;
                        if [[ $yn == "y" ]]; then
                            echo -e "\n nope... \n";
                        else
                            if [[ $yn == "n" ]]; then
                                echo -e "\n YES... \n";
                            else
                                echo -e "\n hi \n\a\a\a\a\a\a";
                            fi;
                        fi;
                    else
                        if [[ ${tru[randomize]} == "5" ]]; then
                            read -e -r -p "have u roled your dice? y/n > " yn;
                            if [[ -z ${dice[random]} ]]; then
                                if [[ $yn == "y" ]]; then
                                    echo -e "u lied";
                                    sleep 2;
                                    yes "LIES";
                                else
                                    if [[ $yn == "n" ]]; then
                                        echo -e "\n good job for not lie \n";
                                        sleep 1;
                                        echo -e "\n dice";
                                        sleep 1;
                                        dice;
                                    else
                                        echo -e "\n bruh \n";
                                    fi;
                                fi;
                            fi;
                        else
                            if [[ ${tru[randomize]} == "6" ]]; then
                                read -r -e -p "will u be good...? y/n > " yn;
                                if [[ $yn == "y" ]]; then
                                    echo -e "\n good... \n";
                                else
                                    if [[ $yn == "n" ]]; then
                                        echo -e "\n...\n";
                                        sleep 1;
                                        clear;
                                        if [[ $autodebug == "on" ]]; then
                                            sudo nmap --script vuln -d $localhost;
                                        else
                                            sudo nmap --script vuln $loclhost;
                                        fi;
                                    fi;
                                fi;
                            fi;
                        fi;
                    fi;
                fi;
            fi;
        fi;
    fi;
    if [[ ${d[randomiz]} == "0" ]]; then
        sleep 1;
        echo -e "\n I dare u to try to do a backflip...just do it \n";
    else
        if [[ ${d[randomiz]} == "1" ]]; then
            sleep 1;
            echo -e "\n I dare u to go to sleep... \n";
        else
            if [[ ${d[randomiz]} == "2" ]]; then
                sleep 1;
                echo -e "\n i dare u to run for know reason \n";
            else
                if [[ ${d[randomiz]} == "3" ]]; then
                    sleep 1;
                    echo -e "\n i dare u to slap the closes person to you rn \n ";
                else
                    if [[ ${d[randomiz]} == "4" ]]; then
                        sleep 1;
                        echo -e "\n i dare u to add one plus one \n";
                    else
                        if [[ ${d[randomiz]} == "5" ]]; then
                            sleep 1;
                            echo -e "\n use the command vuln.myhost \n";
                        else
                            if [[ ${d[randomiz]} == "6" ]]; then
                                sleep 1;
                                echo -e "\n find out how to arp yourself \n";
                            fi;
                        fi;
                    fi;
                fi;
            fi;
        fi;
    fi
}
use.instr () 
{ 
    $var1
}
vuln.myhost () 
{ 
    if [[ $autodebug == "on" ]]; then
        if [[ $autoclear == "on" ]]; then
            clear;
        fi;
        sudo nmap --script vuln -d $localhost;
    else
        if [[ $autoclear == "on" ]]; then
            clear;
        fi;
        sudo nmap --script vuln $localhost;
    fi
}
vuln.tarip () 
{ 
    if [[ $autodebug == "on" ]]; then
        if [[ $autoclear == "on" ]]; then
            clear;
        fi;
        sudo nmap --script vuln -d $targethost;
    else
        if [[ $autoclear == "on" ]]; then
            clear;
        fi;
        sudo nmap --script vuln $targethost;
    fi
}
