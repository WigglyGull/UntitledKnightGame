keyLeft = keyboard_check(ord("A"));
keyRight = keyboard_check(ord("D"));
keyDown = keyboard_check(ord("S"))
keyJump = keyboard_check_pressed(ord("W"));
keyJumpHeld = keyboard_check(ord("W"));

var move = (keyRight - keyLeft) * walksp;
hsp = approach(hsp, move, 0.4);
vsp += grv;

var onFloor = place_meeting(x, y+1, oWall);

if(onFloor && keyJump){
    vsp = jumpAmt;
    yscale = 1.5;
    xscale = .75;
}
if(vsp < 0 && !keyJumpHeld){
    vsp = lerp(vsp, 0, 0.2);
}

if(place_meeting(x+hsp, y, oWall)){
    while(!place_meeting(x+sign(hsp), y, oWall)){
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

if(place_meeting(x, y+vsp, oWall)){
    while(!place_meeting(x, y+sign(vsp), oWall)){
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

//Animation
if(!onFloor){
    if(sign(vsp) > 0) sprite_index = sPlayerFall; 
    else sprite_index = sPlayerJump;
}else{
    if(hsp == 0) sprite_index = sPlayerIdle;
    else sprite_index = sPlayerRun;
}

if(hsp != 0) flipped = sign(hsp);

xscale = lerp(xscale, 1, .2);
yscale = lerp(yscale, 1, .2);
if(place_meeting(x, y+1, oWall) && !place_meeting(x, yprevious+1, oWall)){
    yscale = .80;
    xscale = 1.25;
}