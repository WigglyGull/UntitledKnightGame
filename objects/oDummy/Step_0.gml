randomize();
yBoingAmount = random_range(0.5, 1);
xBoingAmount = random_range(0.5, 1);

function EnemyHurt(){
    enemyState = ENEMYSTATE.HIT;
    sprite_index = sDummyHurt;

    if(image_xscale == 1) x-=2;
    else x+=2;

    oCamera.yBoingSpd = yBoingAmount;
    oCamera.xBoingSpd = xBoingAmount;
    sleep(50);
}

switch(enemyState){
    case ENEMYSTATE.FREE: sprite_index = sDummyIdle; break;
    case ENEMYSTATE.HIT: sprite_index = sDummyHurt; break;
}

if(AnimationEnd()) enemyState = ENEMYSTATE.FREE;

if(follow.x > x) image_xscale = 1;
else if(follow.x < x) image_xscale = -1;