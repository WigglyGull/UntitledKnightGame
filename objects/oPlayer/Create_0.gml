hsp = 0;
vsp = 0;
grv = 0.3;
walksp = 2.7;
jumpAmt = -5;
flipped = 1;

xscale = 1;
yscale = 1;

state = PLAYERSTATE.FREE;
hitByAttack = ds_list_create();

randomize();
runVfxTimer = random_range(10, 20);

tilemap = layer_tilemap_get_id("Tiles");
enum PLAYERSTATE{
    FREE,
    ATTACK_SLASH,
    ATTACK_COMBO
}