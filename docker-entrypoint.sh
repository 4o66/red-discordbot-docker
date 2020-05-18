#/bin/bash
clear

HelpString='Token not in config file or environtment variable.
Set the TOKEN environment variable, and restart comntainer.
See https://discordpy.readthedocs.io/en/v1.3.3/discord.html#creating-a-bot-account for instructions on generating a token.'

Config=/root/.local/share/Red-DiscordBot/data/redbot/core/settings.json

if [ -f $Config ]; then #Is token set in settings.json?
  echo settings.json file exists, parsing token...
  Token=$(cat $Config | jq .[].GLOBAL.token)
  if [ $Token = 'null' ]; then
    echo Token not set in settings.json, checking for token in environment...
    if [ ${TOKEN} = "null" ]; then #Is the environment variable defaulted?
	  echo token environment varible at the default of "null", set the TOKEN environment variable and restart.
	  echo See https://discordpy.readthedocs.io/en/v1.3.3/discord.html#creating-a-bot-account for instructions on generating a token.
	  exit 1
	elif [ ! -z "${TOKEN}" ]; then #If not, is it set in the environment?
      echo Token found in environment, setting token in settings.json
      Token=${TOKEN}
       cat <<< "$(jq --arg Token $Token '.[].GLOBAL.token = $Token' /root/.local/share/Red-DiscordBot/data/redbot/core/settings.json)" > /root/.local/share/Red-DiscordBot/data/redbot/core/settings.json
    else
      echo $HelpString
      exit 1
    fi
  fi
  echo Token is set: $Token
else
  echo settings.json missing from [volume root]/Red-DiscordBot/data/redbot/core
  echo Restore from backup or create a new copy
  exit 1
fi

echo starting Red
exec redbot redbot