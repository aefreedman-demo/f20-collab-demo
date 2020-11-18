/// @description Insert description here
// You can write your code in this editor

var spacing = 80
var cards_in_hand = ds_list_size(global.hand)

switch(global.state) 
{
  case state.setup:
    //deal two cards into 'hand' list and move to table

    if (cards_in_hand < 3) 
	{
      //var card = global.deck[| cards_in_hand] // same as find value
	  var card = ds_list_find_value(global.deck, cards_in_hand)
      ds_list_add(global.hand, card)
      card.target_x = room_width / 3 + cards_in_hand * spacing
      card.target_y = room_height / 2
	  Sleep(250)
    } 
	else 
	{
       global.state = state.play
    }
    break;
	
  case state.play:
  
	if (global.selected != noone && mouse_check_button_pressed(mb_left)) 
	{
		global.selected.face_up = true
		Sleep(250)
		break
	}
		
	var cards_face_up = 0	
	var card_one = noone
	var card_two = noone
		
	// count face up cards first
	for (i = 0; i < cards_in_hand; i++)
	{
		var card = ds_list_find_value(global.hand, i)
		
		if card.face_up
		{
			cards_face_up++
			
			if (cards_face_up == 1)
				card_one = card
			if (cards_face_up == 2)
				card_two = card
		}
	}
	
	// if there are two face up, flip all of them back over
	if cards_face_up >= 2
	{
		show_debug_message(string(cards_face_up))
		Sleep(250)
		for (i = 0; i < cards_in_hand; i++)
		{
			var card = ds_list_find_value(global.hand, i)
			card.face_up = false
		} 
		
		// go to the next state if both of the cards match
		if (card_one.card_type == card_two.card_type)
			global.state = state.resolve
	}
	
   break;
   
   case state.resolve:
   
    //return all cards in 'hand' to deck
	for (i = 0; i < cards_in_hand; i++)
	{
		var card = ds_list_find_value(global.hand, i)
		card.face_up = false
		ds_list_insert(global.deck, 0, card)
		card.target_x = x
		card.target_y = y
		Sleep(250)
	} 
	   
	   
	ds_list_clear(global.hand)
	global.state = state.setup
  
   
   break
 }