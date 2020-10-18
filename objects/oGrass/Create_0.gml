randomize();
xscale = irandom(1);
grassNum = irandom(2);
timer = random_range(100, 200);

image_speed = 0;
localFrame = 0;
animating = false;
animationEnd = false;

if(xscale = 0){
    image_xscale = -1;
    x += 1;
}else image_xscale = 1;

function animateSprite(setup, numOfAnims){
    var _totalFrames = sprite_get_number(sprite_index) / numOfAnims;
    image_index = localFrame + (grassNum * _totalFrames);
    if(animationEnd){
        animating = false;
        animationEnd = false;
    }

    if(!setup){
        localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

        if(localFrame >= _totalFrames){
            localFrame -= _totalFrames;
            animationEnd = true;
        }
    }
}
animateSprite(true, 3);