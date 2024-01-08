shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture,repeat_disable;
uniform vec4 target_color : source_color;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 color = texture(screen_texture,SCREEN_UV);
	//COLOR = vec4(color.r,0.,0.,1.0);
	//COLOR = vec4(color.r * target_color.r,color.g *target_color.g,color.b * target_color.b,1.0);
	COLOR = color * target_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
