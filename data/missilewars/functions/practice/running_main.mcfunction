effect give @s minecraft:haste 2 2 true
effect give @s[nbt=!{foodLevel:20}] minecraft:saturation 2 0 true
scoreboard players enable @s Leave
scoreboard players enable @s ClearPractice
scoreboard players reset @s JoinSpectators
scoreboard players reset @s ChooseMap
scoreboard players reset @s GiveBook
scoreboard players reset @s ChooseMissileSet
scoreboard players reset @s MissileSetSelect
scoreboard players reset @s ToggleRanked

function missilewars:main/shared_run_main

execute store result score @s m.Items run clear @s minecraft:creeper_spawn_egg 0
execute as @s[scores={m.Game=1..,m.Items=0},x=0] at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:creeper_spawn_egg"}}] run function missilewars:new_missile/give/tomohawk
execute store result score @s m.Items run clear @s minecraft:wolf_spawn_egg 0
execute as @s[scores={m.Game=1..,m.Items=0},x=0] at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:wolf_spawn_egg"}}] run function missilewars:new_missile/give/juggurnaut
execute store result score @s m.Items run clear @s minecraft:ocelot_spawn_egg 0
execute as @s[scores={m.Game=1..,m.Items=0},x=0] at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:ocelot_spawn_egg"}}] run function missilewars:new_missile/give/lightning
execute store result score @s m.Items run clear @s minecraft:witch_spawn_egg 0
execute as @s[scores={m.Game=1..,m.Items=0},x=0] at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:witch_spawn_egg"}}] run function missilewars:new_missile/give/shieldbuster
execute store result score @s m.Items run clear @s minecraft:cave_spider_spawn_egg 0
execute as @s[scores={m.Game=1..,m.Items=0},x=0] at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:cave_spider_spawn_egg"}}] run function missilewars:new_missile/give/custom
execute store result score @s m.Items run clear @s minecraft:snowball 0
execute at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:snowball"}}] run give @s[scores={m.Game=1..,m.Items=0},x=0] minecraft:snowball{display:{Name:'{"text":"Shield"}'}}
execute as @s store result score @s m.Items run clear @s minecraft:arrow 0
execute at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:arrow"}}] run give @s[scores={m.Game=1..,m.Items=0},x=0] minecraft:arrow 64
execute as @s store result score @s m.Items run clear @s minecraft:firework_rocket 0
execute at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:firework_rocket"}}] run give @s[scores={m.Game=1..,m.Items=0},x=0] minecraft:firework_rocket{display:{Name:'{"text":"Fireball"}'}}
execute as @s store result score @s m.Items run clear @s minecraft:tnt 0
execute at @s anchored eyes unless entity @e[distance=..2,type=item,nbt={Item:{id:"minecraft:tnt"}}] run give @s[scores={m.Game=1..,m.Items=..1},x=0] minecraft:tnt 63

execute as @s[scores={Leave=1}] run function missilewars:end/leave
execute as @s[scores={Leave=1}] run scoreboard players set @s Leave 0

execute as @s[scores={ClearPractice=1}] at @s at @e[type=area_effect_cloud,tag=PracticeArea,sort=nearest,limit=1] run summon minecraft:area_effect_cloud ~ ~ ~-112 {Age: -2147483648, Duration: -1, WaitTime: -2147483648, Tags: ["PracticeClear"]} 
execute as @s[scores={ClearPractice=1}] run scoreboard players set @s ClearPractice 0

execute as @s[scores={m.deathCheck=1..1000}] at @s run function missilewars:game_modes/death