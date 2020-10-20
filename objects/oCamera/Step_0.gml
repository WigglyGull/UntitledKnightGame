if(instance_exists(follow)){
    xTo = follow.x;
    yTo = follow.y-10;
}

x += (xTo - x)/10;
y += (yTo - y)/10;

var _spr_y = spring(yBoing, yBoingSpd, 0, 0.2, 0.1);
yBoing = _spr_y[0];
yBoingSpd = _spr_y[1];

y+=yBoing;

x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

UpdateCam();