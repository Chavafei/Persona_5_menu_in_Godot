shader_type canvas_item;

render_mode blend_mix;
uniform sampler2D screen_texture : hint_screen_texture,repeat_disable;
uniform vec3 target_color : source_color;
uniform vec3 replace_color : source_color; // Replace with red
uniform float threshold = 0.5;
uniform float softness = 0.3;
uniform float mul = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(screen_texture,SCREEN_UV);
	//COLOR = vec4(color.r,0.,0.,1.0);
	//COLOR = vec4(color.r + target_color.r,color.g + target_color.g,color.b + target_color.b,1.0);

	 // Get difference to use for falloff if required
  	float diff = distance(color.rgb, target_color) - threshold;
  
  // Apply linear falloff if needed, otherwise clamp
  	float factor = clamp(diff / softness, 0.0, 1.0);
  
	
	vec3 lim = vec3(mix(replace_color, color.rgb, factor));
	//COLOR.rgb = COLOR.rgb - color.rgb;
	vec3 main_color = COLOR.rgb;
	
	COLOR.rgb = (color.rgb * target_color) + (mul * color.rgb );
	
	

	//COLOR = vec4(color.r * target_color.r,color.g *target_color.g,color.b * target_color.b,1.0);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
