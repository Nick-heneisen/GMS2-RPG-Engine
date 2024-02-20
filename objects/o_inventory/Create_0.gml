//whether inv has set up or not
setup = false;

//inv sprite settings
inv_sprite = s_dialogue_box;
inv_image = 0;
inv_image_speed = 0;
margin_x = 32;
margin_y = 16;

//inv general
curs_x = 0;
curs_y = 0;
item_using = false;
global.CurrItem = undefined;
selected = false;
inv_page = 0;
inv_pages = global.InvSize / 6;

//inv sprite magic nums
inv_width = 576;
inv_height = 160;
bottom_width = 576;
bottom_height = 112;
inv_sprite_w = sprite_get_width(inv_sprite);
inv_sprite_h = sprite_get_height(inv_sprite);
target_w = inv_width / inv_sprite_w;
target_w_bot = bottom_width / inv_sprite_w;
target_h = inv_height / inv_sprite_h;
target_h_bot = bottom_height / inv_sprite_h;
icon_margin = 16;
text_margin = 80;
desc_margin = 8;

//item options
option[0] = "Use";
option[1] = "Remove";

op_length = array_length(option);
pos = 0;
bottom_h_inbetween = 0;


//inv magic nums
inv_border = 24;
inv_h_inbetween = 0;

//basic placement of inv
inv_x = 16;
inv_y = 16;
bottom_x = 16;
bottom_y = 352;

close_key = false;

//trans
transitioning_in = true;
transitioning_out = false;
trans_clock = 1;

//transition time, higher is faster
t_time = 3;