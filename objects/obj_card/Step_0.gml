/// @description Insert description here
// You can write your code in this editor

// move x and y towards target position with lerp
// could also use move_towards_point

x = lerp(target_x, x, 0.5)
y = lerp(target_y, y, 0.5)

if position_meeting(mouse_x, mouse_y, obj_card)
	global.selected = instance_nearest(mouse_x, mouse_y, obj_card)
else
	global.selected = noone
