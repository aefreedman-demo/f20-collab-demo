/// @description Insert description here
// You can write your code in this editor
ini_open("./settings.ini")
global.numcards = ini_read_real("cards", "num", 3)
global.deck = ds_list_create()
global.hand = ds_list_create()
global.selected = noone

enum state
{
	setup,
	play,
	resolve
}

global.state = state.setup


var spacing = 10
var card_object = obj_card // name of object in assets

for (i = 0; i < global.numcards; i++) 
{
	var newcard = instance_create_layer(x, y, "Instances", card_object);

	//newcard.face_index = floor(3 * i / global.numcards);// this will need some explaining
	newcard.card_type = choose(face_index.blue, face_index.purple, face_index.red)
	newcard.target_x = x;
	newcard.target_y = y - spacing * i;
	newcard.face_up = false;

	ds_list_add(global.deck, newcard);
}

ini_close()