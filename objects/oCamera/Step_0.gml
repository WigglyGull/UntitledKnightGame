if(instance_exists(follow)){
    xTo = follow.x;
    yTo = follow.y;
}

x += (xTo - x)/20;
y += (yTo - y)/20;

x = clamp(x, view_w_half, room_width-view_w_half);
y = clamp(y, view_h_half, room_height-view_h_half);

UpdateCam();