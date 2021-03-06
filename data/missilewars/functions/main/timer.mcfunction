execute as @e[type=area_effect_cloud,tag=GameMarker,x=0] run scoreboard players remove @s m.Timer 1
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0] run scoreboard players operation @s m.TimerSecs = @s m.Timer
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0] run scoreboard players operation @s m.TimerTick = @s m.Timer
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0] run scoreboard players operation @s m.TimerSecs /= TPS m.Constants
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0] run scoreboard players operation @s m.TimerTick %= TPS m.Constants
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.TimerTick=0}] if score @s m.Timer matches 1..2147483647 run tellraw @a[x=0] ["",{"text":"Game Starting in "},{"score":{"name":"@e[type=area_effect_cloud,tag=GameMarker,x=0,limit=1]","objective":"m.TimerSecs"}}]
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.TimerTick=0}] if score @s m.Timer matches 1..2147483647 run playsound minecraft:block.note_block.chime block @a[x=0] ~ ~ ~ 0.5 2 1
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0},limit=1] run tellraw @a[x=0] {"text": "Game Started"}
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0},limit=1] at @s run scoreboard players set @s m.GameState 1
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0},limit=1] at @s run playsound minecraft:block.note_block.bit block @a[x=0] ~ ~ ~ 1 2 1
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0}] at @s run clear @a[x=0] magenta_wool
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0}] run function missilewars:new_missile/new_missile
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0}] run function missilewars:new_missile/new_missile
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0}] run function missilewars:new_missile/new_missile
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0}] run function missilewars:new_missile/new_missile
execute as @e[type=area_effect_cloud,tag=GameMarker,x=0,scores={m.Timer=0}] run function missilewars:new_missile/new_missile