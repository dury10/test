#!/bin/bash
#
#2018-01-22
#Made by dury10 Fork from Philipp
#donations: XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF


if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root or sudo."
	exit 1
fi

follow () {
	echo -e "\e[1;36m Follow us on Tweeter: @nadirdury  &  @Coin_Magi_XMG \e[0m"
}
slack () {
	echo -e "\e[1;35m Join owr Slack Community: http://slack.m-core.org/ \e[0m"
}
donate () {
	echo -e "\e[1;33m If you found this script useful please donate :) XMG - 9KcKx8TdnNStNkp7qpjzJZ8CyDTs1RiGqF and we will make more! Thanks! \e[0m"
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
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git pthreads zlib  build-essential zlib1g-dev libncurses5-dev curl > /dev/null 2>&1
                                git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null 2>&1
                                cd m-cpuminer-v2
                                sudo ./autogen.sh > /dev/null 2>&1
                                sudo ./configure CFLAGS="-O3" CXXFLAGS="-O3" > /dev/null 2>&1
                                sudo make clean > /dev/null 2>&1 && sudo  make -j > /dev/null 2>&1
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
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git pthreads zlib  build-essential zlib1g-dev libncurses5-dev curl > /dev/null 2>&1
                                git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null 2>&1
                                cd m-cpuminer-v2
                                sudo ./autogen.sh > /dev/null 2>&1
                                sudo CFLAG="-O2 mfpu=neon-vfpv4" ./configure > /dev/null 2>&1
				read -p "Are you using Raspberry. Yes/No [yY/nN]" pi
	  case $pi in
	  [yY]* )
				sudo sed -i 's/-march=native/-mcpu=cortex-a53/g' Makefile
				sudo sed -i 's/-march=mative/-mcpu=cortex-a53/g' m7/Makefile
				echo "The cpu detection was set to cortex-a53"
		  break;;
	  [nN]* )
				echo "The cpu detection it's set to native"

		  break;;
	  * )    echo "Yes/No [yY/nN]";;
	  esac

                                sudo make clean > /dev/null 2>&1 && sudo  make -j4 > /dev/null 2>&1
                                echo "./m-cpuminer-v2"
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
                                DEBIAN_FRONTEND=noninteractive apt-get -y -qq install automake autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++ git pthreads zlib  build-essential zlib1g-dev libncurses5-dev curl > /dev/null 2>&1
                                git clone https://github.com/magi-project/m-cpuminer-v2 > /dev/null 2>&1
                                cd m-cpuminer-v2
                                sudo ./autogen.sh > /dev/null 2>&1
                                sudo CFLAG="-O2 mfpu=neon-vfpv4" ./configure > /dev/null 2>&1
				read -p "Are you using a Raspberry. Yes/No [yY/nN]" pi
	 case $pi in
	  [yY]* )
				sudo sed -i 's/-march=native/-mcpu=cortex-a53/g' Makefile
				sudo sed -i 's/-march=native/-mcpu=cortex-a53/g' m7/Makefile
				echo "The cpu detection was set to cortex-a53"
		  break;;
	  [nN]* )
				echo "The cpu detection it's native"
		  break;;
	  * ) 	 echo "Yes/No [yY/nN]";;
	 esac

                                sudo make clean > /dev/null 2>&1 && sudo  make -j4 > /dev/null 2>&1
                                echo "./m-cpuminer-v2"
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

                        read -p "poolurl: " poolurl
                        read -p "poolport: " poolport
                        read -p "username: " username
                        read -p "workername: " workername
                        read -p "workerpass: " workerpass
                        read -p "threads: " threads
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
		follow
		slack
		donate
		exit 0;;
       
   armv71)
		folder $default
		path=$(compilearmv71 $default)
		runme $default $path
		follow
		slack
		donate 
		exit 0;;
	  
   armv7l)
                folder $default
                path=$(compilearmv71 $default)
                runme $default $path
                follow
                slack
                donate
                exit 0;;

   aarch64)
		folder $default
		path=$(compileaarch64 $default)
		runme $default $path
		follow
		slack
		donate
		exit 0;;
		
  * )   echo "Your CPU Architecture is not supported. Sorry"
		exit 1;;
     
esac 
