RSRC                    Shader            ��������                                                  resource_local_to_scene    resource_name    code    script           local://Shader_0d4hv �          Shader                      // NOTE: Shader automatically converted from Godot Engine 4.2.1.stable's CanvasItemMaterial.

shader_type canvas_item;
render_mode blend_mix;
uniform sampler2D screen_texture : hint_screen_texture,repeat_disable;

void fragment() {
	vec4 color = texture(screen_texture,SCREEN_UV);
	//COLOR = vec4(color.r,0.,0.,1.0);
	//COLOR = vec4(color.r + target_color.r,color.g + target_color.g,color.b + target_color.b,1.0);

	//COLOR.rgb = COLOR.rgb - color.rgb;
	vec3 main_color = COLOR.rgb;
	
	COLOR.rgb = main_color.rgb - color.rgb;
	
	
	
	
	}       RSRC