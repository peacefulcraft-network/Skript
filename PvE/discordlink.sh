#Allow players to purchase access to discord-link
#discordsrv.link,unlink,help granted via group discord_link
#permissions granted in context global:global because there is no way to tell Skript to check for permissions in a certain context (IE: server=pve)

command /discord-link [<text>] [<text>]:
    usage: /discord-link ? for help
    description: Link your Minecraft account to your Discord account so you can use the #gamechat channel
    executable by: player
    trigger:
        if arg 1 is "buy":
        
            if {%player%.discordsrvable} is not set:
        
                if player's money >= 1000:
                    
                    execute console command "eco take %player% 1000"
                    execute console command "lp user %player% parent add discord_link pve"
                    set {%player%.discordsrvable} to true
                    wait 2 seconds
                    execute console command "sudo %player% discord link"
                    send "&6[&9PCN&6] &7Once you've linked your account, logout and log back into the server for the changes to take effect." to player
                
                else:
                    send "&6[&9PCN&6] &7Sorry, but you need &2$1,000 &7in-game currancy ('/warp shop' money) to purcahse this feature." to player
            
            else:
                send "&6[&9PCN&6] &7You already have access to this feature."
                send "        &7Use '&2/discord link&7' to link your account." to player
        
        else if arg 1 is "linked":
            if {arg 2.discordsrvable} is true:
                send "%arg 2% has purchased Discord link access." to sender
                send "%{%player%.discordsrvable}%" to sender
            else:
                send "%arg 2% has not purchased Discord link access." to sender
        else:
            send "&8--------&6[&9PCN Discord Link&6]&8--------" to player
            send "&7Linking your Minecraft account to your Discord account will allow you to chat with users on the server from the ##gamechat Discord channel." to player
            send "" to player
            send "&2/discord-link buy &7to purchase this feature for $1,000." to player
            send "&8-------------------------------" to player
