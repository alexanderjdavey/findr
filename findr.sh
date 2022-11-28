#!/bin/bash
#findr is a username searching script
#inspired by https://github.com/Blastoise/ and sherlock
#this is mainly a personal project to learn more about bash scripting.

function github() {
	
	url="https://github.com"
	status=$(curl -I -s -L "$url/$username" | grep -w "HTTP" | cut -d " " -f2 | tail -n 1)
	if (( status == 200 )); then
		echo "✅ $username is on Github 🐙"
	else 
		echo "❌ $username is not on Github 🐙"
	fi
}

function reddit() {
	url="https://www.reddit.com/user"
	for i in {1..5}; do
		status=$(curl -I -s -L "$url/$username" \
	   -H 'upgrade-insecure-requests: 1' \
  	   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36' \
  	   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  	   -H 'accept-language: en-GB,en;q=0.9' \
  	   --compressed | grep -w "HTTP" | cut -d " " -f2 | tail -n 1)

	  if (( status == 200 )); then
	  	echo "✅ $username is on Reddit 🤖"
	  	break
	  elif (( status == 404 )); then
	  	echo "❌ $username is not on Reddit 🤖"
	  	break
	  elif (( status == 504 )); then
	  	continue
	  else
	  	echo "❌ $username is not on Reddit 🤖"
	  	break
	  fi
	done
}

function twitter() {	
	url="https://nitter.net"
	status=$(curl -o /dev/null -L -s -w "%{http_code}\n" "$url/$username")
	if (( status == 404 )); then
	echo "❌ $username is not on twitter 🐦"
	elif ((status == 200 )); then
	echo "✅ $username is on twitter 🐦"
	else
	echo "✅ $username is on twitter 🐦"
	fi
}

function facebook() {	
	url="https://www.facebook.com"
	status=$(curl -o /dev/null -L -s -w "%{http_code}\n" "$url/$username")
	if (( status == 404 )); then
	echo "❌ $username is not on facebook 📘"
	elif ((status == 200 )); then
	echo "✅ $username is on facebook 📘"
	else
	echo "✅ $username is on facebook 📘"
	fi
}

function imgur() {	
	url="https://api.imgur.com/account/v1/accounts"
	status=$(curl -o /dev/null -L -s -w "%{http_code}\n" "$url/$username/?client_id=546c25a59c58ad7")
	if (( status == 404 )); then
	echo "❌ $username is not on imgur 🖼"
	elif ((status == 200 )); then
	echo "✅ $username is on imgur 🖼"
	else
	echo "✅ $username is on imgur 🖼"
	fi
}

function naver() {	
	url="https://blog.naver.com"
	status=$(curl -o /dev/null -L -s -w "%{http_code}\n" "$url/$username")
	if (( status == 500 )); then
	echo "❌ $username doesn't have a naver blog 🇳"
	elif ((status == 200 )); then
	echo "✅ $username does have a naver blog 🇳"
	else
	echo "✅ $username does have a naver blog 🇳"
	fi
}


function pastebin() {	
	url="https://pastebin.com/u"
	status=$(curl -o /dev/null -L -s -w "%{http_code}\n" "$url/$username")
	if (( status == 404 )); then
	echo "❌ $username isn't on pastebin 🗑️"
	elif ((status == 200 )); then
	echo "✅ $username is on pastebin 🗑️"
	else
	echo "✅ $username is on pastebin 🗑️"
	fi
}


function soundcloud() {	
	url="https://soundcloud.com"
	status=$(curl -o /dev/null -L -s -w "%{http_code}\n" "$url/$username")
	if (( status == 404 )); then
	echo "❌ $username is not on soundcloud ☁"
	elif ((status == 200 )); then
	echo "✅ $username is on soundcloud ☁"
	else
	echo "✅ $username is on soundcloud ☁"
	fi
}

function twitch() {
	
	url="https://m.twitch.tv"
	status=$(curl -I -s -L "$url/$username" | grep -w "HTTP" | cut -d " " -f2 | tail -n 1)
	if (( status == 200 )); then
		echo "✅ $username is on Twitch 👾"
	else 
		echo "❌ $username is not on Twitch 👾"
	fi
}

function xbox() {
	
	url="https://xboxgamertag.com/search"
	status=$(curl -I -s -L "$url/$username" \
	   -H 'upgrade-insecure-requests: 1' \
  	   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36' \
  	   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  	   -H 'accept-language: en-GB,en;q=0.9' \
  	   --compressed | grep -w "HTTP" | cut -d " " -f2 | tail -n 1)
	if (( status == 200 )); then
		echo "✅ $username is on Xbox 🎮"
	else 
		echo "❌ $username is not on Xbox 🎮"
	fi
}




function findr() {
	clear
	echo ""
	echo "🔍 findr: $(tput setaf 4)searching for $username $(tput setaf 7)"
	echo ""
		github
		reddit
		twitter
		facebook
		imgur
		naver
		pastebin
		soundcloud
		twitch
		xbox
	echo ""
}
#todo:
#youtube
#instagram
#tiktok


username=$1
if [ -z $1 ]; then
	clear
	echo "
 _____ ___ _   _ ____  ____  
|  ___|_ _| \ | |  _ \|  _ \ 
| |_   | ||  \| | | | | |_) |
|  _|  | || |\  | |_| |  _ < 
|_|   |___|_| \_|____/|_| \_\ 

"                       
	read -p "🔍 Enter username you want to find: " username
fi
findr
