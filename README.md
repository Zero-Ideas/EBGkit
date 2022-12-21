# **EBGkit Documentation**
> Before continuing, all examples will assume that there is a player called testdummy123 within your server.

### **EBGkit:FireSpell(element, spell, arguments, charge)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| Element | String | true |
| Spell | String | true |
| Arguments | Any, Table | false |
| Charge | Integer | false |

| Returned Data Type |
| ------ |
| Nil (No Returned Value)|
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:FireSpell("Fire","Great Fire Blast") -- will activate great fire blast
```
**Additional information**
- If arguments is a table, it will fire the DoClientMagic remote with the first element in the table. It will then fire the DoMagic remote with second element in the table.
- If a charge is specified, it will wait for that amount of time before firing the DoMagic remote to simulate charging.

### EBGkit:Punch(player)

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| player | Instance, String | false |


| Returned Data Type |
| ------ |
| Nil (No Returned Value)|
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:Punch() -- will attempt to punch the nearest player within 50 studs
ebgkit:Punch("test") -- will attempt to punch testdummy123
ebgkit:Punch(game.Players.testdummy123) -- will attempt to punch testdummy123
```

### **EBGkit:GetMouse()**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| Nil (No arguments) | nil | false |


| Returned Data Type |
| ------ |
| Userdata (Mouse) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetMouse() -- returns your mouse
```

### **EBGkit:GetPlayer(string)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| string | String | true |


| Returned Data Type |
| ------ |
| Instance (player) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetPlayer("test") -- returns game.Players.testdummy123
```
**Additional information**
- this will return nil if the player does not exist.
### **EBGkit:GetCharacter(player)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| player | Instance, String | false |


| Returned Data Type |
| ------ |
| Instance (Model) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetCharacter("test") -- returns game.Workspace.testdummy123 OR game.Players.testdummy123.Character
ebgkit:GetCharacter(game.Players.testdummy123) -- returns game.Workspace.testdummy123 OR game.Players.testdummy123.Character

```
**Additional information**
- this may error.
- this will return your own character if no argument is given.

### **EBGkit:GetServerMousePos(player)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| player | Instance, String | false |


| Returned Data Type |
| ------ |
| Vector3 (player's mouse position) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetServerMousePos("test") -- returns testdummy123's mouse position
ebgkit:GetServerMousePos(game.Players.testdummy123) -- returns testdummy123's mouse position
ebgkit:GetServerMousePos() -- returns your mouse position
```


### **EBGkit:GetServerCameraPos(player)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| player | Instance, String | false |


| Returned Data Type |
| ------ |
| Vector3 (player's camera position) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetServerCameraPos("test") -- returns testdummy123's camera position
ebgkit:GetServerCameraPos(game.Players.testdummy123) -- returns testdummy123's camera position
ebgkit:GetServerCameraPos() -- returns your camera position
```


### **EBGkit:GetNearestPlayer(specifiedradius)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| specifiedradius | Integer | false |


| Returned Data Type |
| ------ |
| Instance (Player) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetNearestPlayer(100) -- returns the nearest player within 100 studs
ebgkit:GetNearestPlayer() -- returns the nearest player in the game
```

### **EBGkit:GetNearestPlayerToMouse(specifiedradius)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| specifiedradius | Integer | false |


| Returned Data Type |
| ------ |
| Instance (Player) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetNearestPlayerToMouse(100) -- returns the nearest player within 100 studs to your mouse
ebgkit:GetNearestPlayerToMouse() -- returns the nearest player in the game to your mouse
```

### **EBGkit:GetPlayerData(player)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| player | Instance, String | false |


| Returned Data Type |
| ------ |
| Table (player's data) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:GetPlayerData("test") -- returns testdummy123's data
ebgkit:GetPlayerData(game.Players.testdummy123) -- returns testdummy123's data
ebgkit:GetPlayerData() -- returns your data
```

### **EBGkit:IsHitByAce()**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| nil (accepts no arguments) | nil | false |


| Returned Data Type |
| ------ |
| Boolean |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:IsHitByAce() -- returns true if you have been hit by ace, false if not
```


### **EBGkit:SetMoveDirection(MoveDirection)**
| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| MoveDirection | Integer | true |


| Returned Data Type |
| ------ |
| Boolean (true if the the movedirection was set, false if not) |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:SetMoveDirection(1) - returns true 
```
**Additional Information**
- if the movedirection is positive, you will move as normal
- if the movedirection is negative, your movement will be reversed
- if the movedirection is 0, you will be unable to move

### **EBGkit:IsHoldingMouse(player)**

| Accepted Arguments | Data Type | Required |
| ------ | ------ | ------ |
| player | Instance, String | false |


| Returned Data Type |
| ------ |
| Boolean |
```lua
local ebgkit = loadstring(game:HttpGet("https://raw.githubusercontent.com/happyplay098/modules/main/EBGkit.lua"))()
ebgkit:IsHoldingMouse("test") -- returns true if testdummy123 is holding their mouse, false if not
ebgkit:IsHoldingMouse(game.Players.testdummy123) -- returns true if testdummy123 is holding their mouse, false if not
ebgkit:IsHoldingMouse() -- returns true if you are holding your mouse, false if not
```
