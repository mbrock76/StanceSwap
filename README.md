# StanceSwap
An addon for classic wow to swap weapons when changing stances as a warrior.

Only works out of combat due to wow restrictions, for an in combat solution setup individual macros on your action bar.

To use this you will need to regularly update your weapon sets in the .lua file with the names of your items:
local weaponSets = {
    [1] = { main = "Black Metal Axe", off = "Grunt Axe of Agility" },      -- Battle
    [2] = { main = "Black Metal Axe", off = "Burnished Shield" },          -- Defensive
    [3] = { main = "Black Metal Axe", off = "Grunt Axe of Agility" },      -- Berserker
}