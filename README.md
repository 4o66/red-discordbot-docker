# red-discordbot-docker
Red Discord Bot Unofficial Docker Container
Music, Moderation, Trivia, Stream Alerts and Fully Modular.

Overview
Red is a fully modular bot – meaning all features and commands can be enabled/disabled to your liking, making it completely customizable. This is also a self-hosted bot – meaning you will need to host and maintain your own instance. You can turn Red into an admin bot, music bot, trivia bot, new best friend or all of these together!

Installation is easy, and you do NOT need to know anything about coding! Aside from installation and updating, every part of the bot can be controlled from within Discord.

The default set of modules includes and is not limited to:

Moderation features (kick/ban/softban/hackban, mod-log, filter, chat cleanup) 
Trivia (lists are included and can be easily added) 
Music features (YouTube, SoundCloud, local files, playlists, queues) 
Stream alerts (Twitch, Youtube, Mixer, Hitbox, Picarto) 
Bank (slot machine, user credits) 
Custom commands 
Imgur/gif search 
Admin automation (self-role assignment, cross-server announcements, mod-mail reports) 
Customisable command permissions 

Additionally, other plugins (cogs) can be easily found and added from our growing community of cog repositories at https://github.com/Cog-Creators/Red-DiscordBot#plugins

Installation 
This container was created using the official docs at https://docs.discord.red/en/stable/install_linux_mac.html and includes pyenv and postgres backend support. Only a single instance per container is supported.

Recommended command: docker run -d --name red_discordbot -e TOKEN='[INSERT BOT TOKEN HERE]' -v redbot_shell:/root/.local/share/ 4o66/red-discordbot:latest

Subsequent runs do not need the TOKEN variable set as it is put into the settings.json file.

Plugins Red is fully modular, allowing you to load and unload plugins of your choice, and install 3rd party plugins directly from Discord! A few examples are:

Cleverbot integration (talk to Red and she talks back) 
Ban sync 
Welcome messages 
Casino 
Reaction roles 
Slow Mode 
AniList 
And much, much more! 
Feel free to take a peek at a list of available 3rd party cogs! https://cogboard.red/t/approved-repositories/210

Join the community! Red is in continuous development, and it’s supported by an active community which produces new content (cogs/plugins) for everyone to enjoy. New features are constantly added. If you can’t find the cog you’re looking for, consult our guide on building your own cogs!

Join us on our Official Discord Server!

License Released under the GNU GPL v3 license.

Red is named after the main character of "Transistor", a video game by Super Giant Games.
