/// @description Insert description here
// You can write your code in this editor

if face_up
	switch card_type
	{

		case face_index.blue:
		sprite_index = spr_blue
		break
	
		case face_index.purple:
		sprite_index = spr_purple
		break
	
		case face_index.red:
		sprite_index = spr_red
		break

	}
else
	sprite_index = spr_back
	

	
draw_sprite(sprite_index, image_index, x, y)