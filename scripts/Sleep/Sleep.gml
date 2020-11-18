// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Sleep(millis){
	var time = get_timer() / 1000;

	while ((get_timer() / 1000 - time) < millis)
	{
		// Just keep looping
	}
}