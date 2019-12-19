/// @description Insert description here
// You can write your code in this editor

move = 32;
move_x = 0;
move_y = 0;


//move & collision;
if(keyboard_check_pressed(ord("A"))){
	move_x -= move;
	sprite_index = spr_slime_left;
}
if(keyboard_check_pressed(ord("D"))){
	move_x += move;
	sprite_index = spr_slime_right;
}
if(keyboard_check_pressed(ord("W"))){
	move_y -= move;
	sprite_index = spr_slime_left;
}
if(keyboard_check_pressed(ord("S"))){
	move_y += move;
	sprite_index = spr_slime_right;
}

if(place_meeting(x + move_x,y,obj_wall)){
	move_x = 0;
}

if(place_meeting(x,y + move_y,obj_wall)){
	move_y = 0;
}


//collision with the hole

if(place_meeting(x + move_x,y,obj_hole)){
	move_x = 0;
}

if(place_meeting(x,y + move_y,obj_hole)){
	move_y = 0;
}



//pushing box

if(place_meeting(x + move_x,y,obj_box)){
	collision_obj =  instance_place(x + move_x,y,obj_box);
	if(place_meeting(collision_obj.x + move_x,collision_obj.y,obj_wall)){
		move_x = 0;
	}
	if(place_meeting(collision_obj.x + move_x,collision_obj.y,obj_box)){
		move_x = 0;
	}
	collision_obj.x+=move_x;
}

if(place_meeting(x,y + move_y,obj_box)){
	collision_obj =  instance_place(x,y + move_y,obj_box);
	if(place_meeting(collision_obj.x,collision_obj.y + move_y,obj_wall)){
		move_y = 0;
	}
	if(place_meeting(collision_obj.x,collision_obj.y + move_y,obj_box)){
		move_y = 0;
	}
	collision_obj.y+=move_y;
}


//move
x += move_x;
y += move_y;