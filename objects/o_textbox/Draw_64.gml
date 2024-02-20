
var _accept_key = keyboard_check_pressed(ord("Z"));

if (!transitioning_in && !transitioning_out) {
	
	//sets line width if avatar is present
	if avatar != undefined {
		line_width = (textbox_width - border_margin * 2) - 94;
	}
	
	if setup == false {
	
		setup = true;
	
		draw_set_font(global.font_main);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
	
		//loop through pages
		page_number = array_length(text);
	
		//finds # of characters in page and stores it to array
		for (var _p = 0; _p < page_number; _p++) {
			set_text_defaults();
			
			text_length[_p] = string_length(text[_p]);
		
			text_x_offset[_p] = 0;
			
			for(var _c = 0; _c < text_length[_p]; _c++) {
				
				var _char_pos = _c + 1;
				
				//stor individual characters in char array
				char[_c, _p] = string_char_at(text[_p], _char_pos);
				
				//get width of line
				var _txt_to_char = string_copy(text[_p], 1, _char_pos);
				var _current_txt_width = string_width(_txt_to_char) - string_width(char[_c, _p]);
				
				//get last free space
				if (char[_c, _p] == " ") last_free_space = _char_pos + 1;
				
				//get line breaks
				if _current_txt_width - line_break_offset[_p] > line_width {
					line_break_pos[line_break_num[_p], _p] = last_free_space;
					line_break_num[_p]++;
					var _txt_up_to_last_space = string_copy(text[_p], 1, last_free_space);
					var _last_free_space_string = string_char_at(text[_p], last_free_space);
					line_break_offset[_p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
				}
			}
			
			//getting character's coordinates
			for (var _c = 0; _c < text_length[_p]; _c++) {
				
				var _char_pos = _c + 1;
				var _txt_x = textbox_x + text_x_offset[_p] + border_margin;
				var _txt_y = textbox_y + margin_y;
				
				//get current width of line
				var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
				var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c, _p] );
				var _txt_line = 0;
				
				//compensate for string breaks
				for (var _lb = 0; _lb < line_break_num[_p]; _lb++) {
					
					//if the current looping c har is after a line break
					if _char_pos >= line_break_pos[_lb, _p] {
						var _str_copy = string_copy(text[_p], line_break_pos[_lb, _p], _char_pos - line_break_pos[_lb, _p]);
						_current_txt_w = string_width(_str_copy);
						
						//record the line this character should be on
						_txt_line = _lb + 1;
					}
				}
				
				//add ti x abd y coordinates bease on new info
				char_x[_c, _p] = _txt_x + _current_txt_w;
				char_y[_c, _p] = _txt_y + _txt_line * line_sep;
			}
		}
	
	}
	
	//typing text
	if text_pause_timer <= 0 {
		if draw_char < text_length[page] {
			draw_char += text_speed;
			draw_char = clamp(draw_char, 0, text_length[page]);
			var _check_char = string_char_at(text[page], draw_char);
			if _check_char == "." || _check_char == "," || _check_char == "!" || _check_char == "?" {
				text_pause_timer = text_pause_time;
			}
		}
		
	} else {
		
		text_pause_timer--;
		
	}

	//flip through pages
	if _accept_key {
	
		//if typing is done, go to next page
		if draw_char == text_length[page] {
		
			//next page 
			if page < page_number - 1 {
				page++
				draw_char = 0;
			
				//get rid of text box
			} 
			else {
				transitioning_out = true;
			}
		
			//if not done typing
		} 
		else {
			draw_char = text_length[page];
		}
	}	
	


	//back of textbox
	draw_sprite_ext(textb_sprite, 1, textbox_x, textbox_y, textbox_width/textb_sprite_w, textbox_height/textb_sprite_h, 0, c_white, 1);
	
	//draw avatar (if required)
	if avatar != undefined {
		draw_sprite_ext(avatar, 0, textbox_width, textbox_y + 16, 2.5, 2.5, 0, c_white, 1);
	}
	
	//draw text
	
	for (var _c = 0; _c < draw_char; _c++) {
		draw_text(char_x[_c, page], char_y[_c, page], char[_c, page]);
	}
		

}

else if (transitioning_out) {
	if (trans_clock > 0) {
		var _curr_width = textb_sprite_w * trans_clock;
		draw_sprite_ext(textb_sprite, 1, (textbox_x + (textbox_width / 2) - (_curr_width / 2)), textbox_y, trans_clock, target_h, 0, c_white, 1);
		trans_clock -= t_time;

	}
	else {
		instance_destroy();
		o_player.state = PLAYERSTATE.IDLE;
	}
}

else if (transitioning_in) {

	
	if (trans_clock < target_w) {
		var _curr_width = textb_sprite_w * trans_clock;
		draw_sprite_ext(textb_sprite, 1, (textbox_x + (textbox_width / 2) - (_curr_width / 2)), textbox_y, trans_clock, target_h, 0, c_white, 1);
		trans_clock += t_time;

	}
	else {
		transitioning_in = false;
		trans_clock = target_w;
		draw_sprite_ext(textb_sprite, 1, textbox_x, textbox_y, textbox_width/textb_sprite_w, textbox_height/textb_sprite_h, 0, c_white, 1);

	}
}

//show_debug_message(textb_sprite_w);