// Create a surface the size of the current room
// You could also create a surface the size of the current view, but I won't get into that
surf = surface_create(room_width, room_height);

// The following two lines clear the surface
// There is no guarantee that the surface doesn't contain garbage info post-creation
surface_set_target(surf);
draw_clear_alpha(c_black, 0);

// Reset to application surface
surface_reset_target();

randomize();
changeAmount = random_range(0.005, 0.01);
startGrow = irandom(1);

lightRadius = 50;
innerLightRadius = 10;
if(startGrow == 0) grow = true; 
else grow = false;
maxRadius = 55;
minRadius = 50;
maxInnerRadius = 15;
minInnerRadius = 10;