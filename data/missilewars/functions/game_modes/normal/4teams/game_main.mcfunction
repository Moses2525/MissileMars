function missilewars:game_modes/4teams/triggers

function missilewars:main/timer
execute if entity @s[scores={m.Timer=0}] run function missilewars:game_modes/normal/4teams/load_map
execute if entity @s[scores={m.Timer=0}] unless entity @a[team=Blue,x=0] run scoreboard players set @s m.BlueLoss 1
execute if entity @s[scores={m.Timer=0}] unless entity @a[team=Green,x=0] run scoreboard players set @s m.GreenLoss 1
execute if entity @s[scores={m.Timer=0}] unless entity @a[team=Red,x=0] run scoreboard players set @s m.RedLoss 1
execute if entity @s[scores={m.Timer=0}] unless entity @a[team=Black,x=0] run scoreboard players set @s m.BlackLoss 1
execute if entity @s[scores={m.Timer=0}] unless entity @a[x=0,team=!Spectator] run function missilewars:end/finish_game

execute if score @s m.GameState matches 1 run function missilewars:game_modes/normal/4teams/check_end_game
execute as @s[scores={m.GameState=2..,m.EndTimer=0}] at @s run function missilewars:end/finish_game
execute as @s[scores={m.GameState=2..}] at @s run scoreboard players remove @s m.EndTimer 1

execute if score @s m.GameState matches 1 at @e[type=area_effect_cloud,tag=Base,x=0] run function missilewars:maps/spawn_plat

execute if score @s m.BlueLoss matches 1 at @e[type=area_effect_cloud,tag=BlueBase,x=0] run particle minecraft:barrier ~ ~80 ~ 5 5 5 1 5 force @a[x=0]
execute if score @s m.GreenLoss matches 1 at @e[type=area_effect_cloud,tag=GreenBase,x=0] run particle minecraft:barrier ~ ~80 ~ 5 5 5 1 5 force @a[x=0]
execute if score @s m.RedLoss matches 1 at @e[type=area_effect_cloud,tag=RedBase] run particle minecraft:barrier ~ ~80 ~ 5 5 5 1 5 force @a[x=0]
execute if score @s m.BlackLoss matches 1 at @e[type=area_effect_cloud,tag=BlackBase,x=0] run particle minecraft:barrier ~ ~80 ~ 5 5 5 1 5 force @a[x=0]

execute as @a[scores={m.Game=1..},x=0] at @s run function missilewars:game_modes/normal/4teams/running_main
function missilewars:item_managers/run_items

execute if score @s m.GameState matches 1 unless entity @a[x=0] run function missilewars:end/finish_game