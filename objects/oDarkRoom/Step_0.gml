if (surface_exists(surf)) {
    surface_set_target(surf);

    draw_set_color(c_black);
    draw_set_alpha(0.2);
    draw_rectangle(0, 0, room_width, room_height, 0);

	gpu_set_blendmode(bm_subtract);
	draw_set_alpha(1);
    draw_set_color(c_orange);
	var r = lightRadius;
    var innerR = innerLightRadius;
    with (oTorch) draw_circle(x-1 , y-1, r, false);

    gpu_set_blendmode(bm_normal);
    draw_set_alpha(0.4);
    draw_set_color(c_orange);
    with (oTorch) draw_circle(x-1 , y-1, innerR, false);
    
    gpu_set_blendmode(bm_normal);
    draw_set_alpha(1);
    surface_reset_target();
} else {
    surf = surface_create(room_width, room_height);
    surface_set_target(surf);
    draw_clear_alpha(c_black, 0);
    surface_reset_target();
}

if(lightRadius <= minRadius+1) grow = true;
else if(lightRadius >= maxRadius-1) grow = false;
if(grow){
    lightRadius = lerp(lightRadius, maxRadius, changeAmount);
    innerLightRadius = lerp(innerLightRadius, maxInnerRadius, changeAmount);
}
else{
    lightRadius = lerp(lightRadius, minRadius, changeAmount);
    innerLightRadius = lerp(innerLightRadius, minInnerRadius, changeAmount);
}
