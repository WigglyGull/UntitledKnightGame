function make_fx(_sprite, _x, _y, _depth){
	var _obj = instance_create_depth(_x, _y, _depth, fx);
	_obj.sprite_index = _sprite;
	
	if argument_count > 4 {
		_obj.image_xscale = argument[4];
	}
	if argument_count > 5 {
		_obj.image_yscale = argument[5];
	}
	if argument_count > 6 {
		_obj.image_angle = argument[6];
	}
	if argument_count > 7 {
		_obj.image_blend = argument[7];
	}
	if argument_count > 8 {
		_obj.image_alpha = argument[8];
	}
	
	return _obj;
}

function playsound(_sound, _pitch) {
    var _s;
    if argument_count > 2 {
        _s = audio_play_sound_at(_sound, argument[2], argument[3], 300, 50, 150, 1, false, -10);
    } else {
        _s = audio_play_sound(_sound, -10, false);
    }
    
    if argument_count > 1 {
		audio_sound_pitch(_s, _pitch);
    }
    
    return _s;
}

function spring(_val, _valsp, _tar, _tension, _damping){
	var _spd_to_add = (_tension * (_tar - _val)) - (_damping * _valsp);
	_valsp += _spd_to_add;

	var result;
	result[0] = _val + _valsp;
	result[1] = _valsp;

	return (result);
}

function approach(_start, _end, _shift) {
	if (_start < _end) return min(_start + _shift, _end); 
	else return max(_start - _shift, _end);
}

function pixelscale(_amt) {
	window_set_size(window_get_width()*_amt, window_get_height()*_amt);
}

function wrap(_value, _min, _max) {
	while (_value < _min) _value += (_max - _min);
	while (_value > _max) _value -= (_max - _min);
	
	return _value;
}

function curve(_val1, _val2, _amount, _curvename, _curveindex) {
	return lerp(_val1, _val2, animcurve_channel_evaluate(animcurve_get_channel(_curvename, _curveindex), _amount))
}

function md_contents() {
	gpu_set_blendenable(true);
	gpu_set_colorwriteenable(true,true,true,true);
	gpu_set_blendmode_ext(bm_dest_alpha, bm_inv_dest_alpha);
	gpu_set_alphatestenable(true);
}
function md_mask_begin() {
	gpu_set_blendenable(false)
	gpu_set_colorwriteenable(false,false,false,true);
	draw_set_alpha(0);
	draw_rectangle(0,0, room_width,room_height, false);
	draw_set_alpha(1);
}
function md_mask_end() {
	gpu_set_alphatestenable(false);
	gpu_set_blendmode(bm_normal);
}

function sleep(_ms) {
	var tt = current_time + _ms;
	while (current_time < tt) { /* loop */ }
}

function cursed_cat() {
    image_stock = sprite_add("https://thiscatdoesnotexist.com/", 0, 0, 0, 0, 0);
    
    return image_stock;
}