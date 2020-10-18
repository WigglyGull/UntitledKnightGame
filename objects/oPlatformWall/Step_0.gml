if(!instance_exists(player)) return;

if(round(player.y + player.sprite_height/2) > y+4 || player.keyDown){
    sprite_index = -1;
}else sprite_index = currentSprite;