if(image_angle <= minTurn+0.5) left = false;
else if(image_angle >= maxTurn-0.5)left = true;
if(!left) image_angle = lerp(image_angle, maxTurn, 0.01);
else image_angle = lerp(image_angle, minTurn, 0.01);