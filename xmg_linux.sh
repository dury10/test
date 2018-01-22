#!/bin/bash

#2018-01-22
#Made by dury10 Fork from Philipp
#donations: XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF


if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root or sudo."
	exit 1
fi

follow () {
	echo "Follow us on Tweeter: @nadirdury & @Coin_Magi_XMG"
}
slack () {
	echo "Join owr Slack Community http://slack.m-core.org/"
}

folder () { 

	if [ $1 -eq 0 ]; then 
		read -p "Input foldername where to create the files: " answer
	else
		answer="miner"
	fi
	
	mkdir $answer
	cd $answer

}

compilex86_64 () { 
	
	while true 
	do 
	
		if [ $1 -eq 0 ]; then 
			read -p "Download and compile newest miner version(takes longer)? Yes/No [yY/nN] " answer 
		else
			answer="y"
		fi

	  # (2) handle the input we were given 
	  case $answer in 
	   [yY]* ) 


                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq update > /dev/null 2>&1
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq upgrade > /dev/null 2>&1
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev > /dev/null 2>&1
                                git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null 2>&1
                                cd m-cpuminer-v2
                                ./autogen.sh > /dev/null 2>&1
                                ./configure CFLAGS="-O3" CXXFLAGS="-O3" > /dev/null 2>&1
                                make clean > /dev/null 2>&1 &&  make -j > /dev/null 2>&1
                                echo "./m-cpuminer-v2"


		  break;;
		   
	   [nN]* )	       
				read -p "Thanks, to exit the install pres Ctrl+C"
		  break;; 
		   
	  * )    echo "Yes/No [yY/nN]";;
		 
	  esac 
	done 

}

compilearmv71 () { 
	


 while true
        do

                if [ $1 -eq 0 ]; then
                        read -p "Download and compile newest miner version. Yes/No [yY/nN] " answer
                else
                        answer="y"
                fi

          # (2) handle the input we were given
          case $answer in
           [yY]* ) 
				DEBIAN_FRONTEND=noninteractive apt-get -y -qq update > /dev/null 2>&1
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq upgrade > /dev/null 2>&1
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev  > /dev/null 2>&1
                                git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null 2>&1
                                cd m-cpuminer-v2
                                ./autogen.sh > /dev/null 2>&1
                                CFLAGS="-O2 mfpu=neon-vfpv4" ./configure > /dev/null 2>&1
				read -p "are using a Raspberry. Yes/No [yY/nN]" pi
	case $pi in
	[yY]* )
				sed -i 's/-march=native/-mcpu=cortex-a53/g' Makefile.am
				echo "The cpu detection was set to cortex-a53"
		  break;;
	[nN]* )
				echo "You are a luck one :D"

                                make clean > /dev/null 2>&1 &&  make -j4 > /dev/null 2>&1
                                echo "./m-cpuminer-v2"
		  break;;
	* )
		echo "Yex/No [yY/nN]";;
 
	esac
		 break;;
           [nN]* )
                                read -p "Thanks, to exit the install pres Ctrl+C"
                  break;;

          * )    echo "Yes/No [yY/nN]";;

		 
	  esac 
	done 

}

compileaarch64 () { 
 while true
        do

                if [ $1 -eq 0 ]; then
                        read -p "Download and compile newest miner version? Yes/No [yY/nN] " answer
                else
                        answer="y"
                fi

          # (2) handle the input we were given
          case $answer in
           [yY]* )  
				DEBIAN_FRONTEND=noninteractive apt-get -y -qq update > /dev/null 2>&1
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq upgrade > /dev/null 2>&1
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git libgmp-dev > /dev/null 2>&1
                                git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null 2>&1
                                cd m-cpuminer-v2
                                ./autogen.sh > /dev/null 2>&1
                                CFLAGS="-O2 mfpu=neon-vfpv4" ./configure > /dev/null 2>&1
		                read -p "Are using a Raspberry. Yes/No [yY/nN]" pi
        case $pi in
        [yY]* )
                                sed -i 's/-march=native/-mcpu=cortex-a53/g' Makefile.am
                                echo "The cpu detection was set to cortex-a53"
                  break;;
        [nN]* )
                                echo "You are a luck one :D"
                                make clean > /dev/null 2>&1 &&  make -j4 > /dev/null 2>&1
                                echo "./m-cpuminer-v2"
		  break;;
           * )
                echo "Yex/No [yY/nN]";;

        esac
                 break;;

           [nN]* )
                                read -p "Thanks, to exit the install pres Ctrl+C"
                  break;;

          * )    echo "Yes/No [yY/nN]";;
	
		 
	  esac 
	done 

}
runme () {

        while true
        do

                if [ $1 -eq 0 ]; then
                        read -p "Would you like to setup your mining pool RunMe? Yes/No [yY/nN] " answer
                else
                        answer="y"
                fi

          # (2) handle the input we were given
          case $answer in
           [yY]* )
                        cd m-cpuminer-v2
                        poolcreds $2 > RunMe
                        chmod +x RunMe
                        echo "Finished installation. Use ./RunMe in your choosen directory /m-cpuminer-v2 to start mining."
			echo "If you want to change pool seting use the command 'sudo nano Runme'"
                  break;;

           [nN]* )
                  break;;

          * )   echo "Yes/No [yY/nN]";;

          esac
        done

}


poolcreds () {

			echo "Let's set up the pool details"
			echo "Enter the pool url, for excemple: xmg.minerclaim.net"
                        read -p "poolurl: " poolurl 
			echo "Enter the pool port, normally its a 4 digit nr, for example: 3333" 
			read -p "poolport: " poolport
			echo "Enter your pool username"
                        read -p "username: " username
			echo "Enter your worker name"
                        read -p "workername: " workername
			echo "Enter your worker password"
                        read -p "workerpass: " workerpass
			echo "Enter how many thread you want to mine with, if your processor have 4 cores you can run 3 for mining and 1 for browsing or you can run all 4 cores" 
                        read -p "threads: " threads
			echo "Enter ho much % of your processor you want to be used for mining, for exemple if you want to use 80% type 80"
                        read -p "cpu_efficiency: "  cpu_efficiency
                        string="./m-minerd -a m7mhash -o stratum+tcp://$poolurl:$poolport -u $username.$workername -p $workerpass -t $threads -e $cpu_efficiency"
                        echo $string
}


type=$(lscpu | grep -m 1 "Architecture:" | sed 's/[^=:]*[=:] //' | sed 's|[/ ]||g')

while true 
do 
  # (1) prompt user, and read command line argument 
  read -p "Use recommended settings? be patient ;)  Yes/No [yY/nN] " answer 
 
  # (2) handle the input we were given 
  case $answer in 
   [yY]* )  default=1
	  break;;
	   
   [nN]* )
			default=0
	  break;; 
	   
  * )    echo "Yes/No [yY/nN]";;
	 
  esac 
done 

case $type in 
   x86_64) 
		folder $default
		path=$(compilex86_64 $default)
		runme $default $path
		echo "If you like what I'm doing please donate :) XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF"
		follow
		slack
		exit 0;;
       
   armv71)
		folder $default
		path=$(compilearmv71 $default)
		runme $default $path
		echo "If you like what I'm doing please donate :) XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF"
		follow
		slack
		exit 0;;
	  

  armv7l)
		folder $default
		path=$(compilearmv71 $default)
		runme $default $path
		echo "If you like what I'm doing please donate :) XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF"
		follow
		slack
		exit 0;;


   aarch64)
		folder $default
		path=$(compileaarch64 $default)
		runme $default $path
		echo "If you like what I'm doing please donate :) XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF"
		follow
		slack
		exit 0;;
		
  * )   echo "Your CPU Architecture is not supported. Sorry"
	follow
	slack
		
	exit 1;;
     
esac 
