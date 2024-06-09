[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

## Group Info
Members : Li Han You & Tracy Ye\
Group Name : Plants VS Zombies\
Link : xxx

## Overview
This is the game Plants VS Zombies recreated on processing. It includes features such as suns randomly dropping from the sky, lawnmowers that activate to protect the house as a last line of defense, zombies that approach in waves, and a set of four plants with unique skills and stats. 

The sunflower plant spawns a sun on either the right or left side of itself every 5 seconds. It is recommended that it is the first plant you place so you can generate enough suns to buy more expensive plants. The peashooter plant releases peas every 1.5 seconds to to damage the approaching zombies. The wallnut plant is a defensive plant with an astounding 2000 hp, allowing you to hold back large waves of zombies and plan your defense as they approach. The ice plant has costs no suns to plant and is able to freeze a zombie in place for 5 seconds. However, every plant has a cooldown that prevents multiple from being placed at once. Keep this in mind as you decide where and when to place a plant. Don't worry if you make a mistake though, as the shovel function can remove a misplaced plant from the field. 

## Instructions

### Compling PvZ
There are no extra installations necessary for running our project. Simply click on the opened Plants VS Zombies window to start the game. If you manage to lose the game, you can restart via the "RETRY" button or, if you are too angry to continue, hit the "EXIT TO MAP" to take a break and cool off. 
```
RETRY = restart the game
EXIT TO MAP = go back to windows screen
```

### Playing the game

#### Placing plants
    Click on the plant on the menu bar to activate the selection of the plant. Then, either click or drag the plant over to the desired patch.
#### Collecting suns
    Click or drag your cursor over the suns to collect them.
#### Pause
    Press "p" to pause the game
#### Cheat
    Press "s" to instantly gain 1000 suns.

### Bugs
Sometimes the ice plant will not recognize a zombie even when it is visually touching it. There is no fix, another zombie will trigger its skill. 

## TL;DR

#### Functions :
```
Sunflower = generate suns
Peashooter = attack zombies
Wallnut = defend
Ice = freeze zombies

Shovel = remove plants
lawnmower = kills all zombies in row
```

#### keybinds :
```
p = pause game
s = +1000 suns
```