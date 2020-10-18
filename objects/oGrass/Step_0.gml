if(timer <= 0){
    animating = true;
    timer = random_range(100, 200);
}

if(animating) animateSprite(false, 3);
else timer -= 1;