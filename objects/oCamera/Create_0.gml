gameWidth = 256;
gameHeight = 144;
zoom = 6;
resolution= 1;

camera = camera_create();
vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
pm = matrix_build_projection_ortho(gameWidth, gameHeight, 1, 3200);

function UpdateCam(){
    var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
    camera_set_view_mat(camera, vm);
}

view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, gameWidth);
view_set_hport(0, gameHeight)
camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;

if(window_get_width() != gameWidth*zoom && window_get_height() != gameHeight*zoom){
    window_set_size(gameWidth*zoom, gameHeight*zoom);
    surface_resize(application_surface, gameWidth*resolution, gameHeight*resolution);
}

follow = oPlayer;
view_w_half = gameWidth/2;
view_h_half = gameHeight/2;
xTo = xstart;
yTo = ystart;

x = follow.x;
y = follow.y;
UpdateCam();