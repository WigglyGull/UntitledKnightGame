keyLeft = key(ord("A"));
keyRight = key(ord("D"));
keyDown = key(ord("S"))
keyJump = keyboard_check_pressed(ord("W"));
keyJumpHeld = key(ord("W"));
keyAttack = keyboard_check_pressed(ord("H"));

switch(state){
    case PLAYERSTATE.FREE: PlayerState_Free(); break;
    case PLAYERSTATE.ATTACK_SLASH: PlayerState_Attack_Slash(); break;
    case PLAYERSTATE.ATTACK_COMBO: PlayerState_Attack_Combo(); break;
}