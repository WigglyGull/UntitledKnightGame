keyLeft = key(ord("A"));
keyRight = key(ord("D"));
keyDown = key(ord("S"))
keyJump = keyboard_check_pressed(ord("W"));
keyJumpHeld = key(ord("W"));

var move = (keyRight - keyLeft) * walksp;
hsp = approach(hsp, move, 0.25);
vsp += grv;

var onFloor = place_meeting(x, y+1, oWall);
if (move != 0) isRunning = true;
else isRunning = false;

if(onFloor && keyJump){
    instance_create_layer(x, y+20, "Player", oJumpFx);
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
    instance_create_layer(x, y+20, "Player", oLandFx);
    yscale = .75;
    xscale = 1.25;
}

randomize();
if(isRunning && onFloor){
    runVfxTimer -= 1;
    if(runVfxTimer <= 0){
        instance_create_layer(x, y+4, "Player", oRunFx);
        runVfxTimer = random_range(10, 20);
    }
}else runVfxTimer = random_range(10, 20);