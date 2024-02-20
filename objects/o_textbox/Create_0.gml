
//depth = -9999;

//parameters
textbox_width = 576;
textbox_height = 112;

margin_y = 5;
border_margin = 18;
line_sep = 22;
line_width = textbox_width - border_margin * 2;

textb_sprite = s_dialogue_box;
textb_image = 0;
textb_image_speed = 0;

//text
page = 0;
page_number = 0;
text[0] = "";

//avatar
avatar = undefined;
 
//text[0] = "waiting for something to happen? waiting for something to happen? waiting for something to happen? waiting for something to happen? ";
//text[1] = "bruh";
//text[2] = "jdfkghfdfujhnfj dnghbjflvdnbhjgvfnbjlgnfbj kvgnfjdbngjfb";

text_length[0] = string_length(text[0]);

char[0, 0] = "";
char_x[0, 0] = 0;
char_y[0, 0] = 0;

draw_char = 0;
text_speed = 1;

setup = false;

//transitioning settings
transitioning_in = true;
transitioning_out = false;
trans_clock = 1;

//transition time, higher is faster
t_time = 3;

//draw textbox
textb_image = textb_image_speed;
textb_sprite_w = sprite_get_width(textb_sprite);
textb_sprite_h = sprite_get_height(textb_sprite);
target_w = textbox_width / textb_sprite_w;
target_h = textbox_height / textb_sprite_h;

textbox_x = 16;
textbox_y = 352;

//effects
set_text_defaults();
last_free_space = 0;
text_pause_timer = 0;
text_pause_time = 16;