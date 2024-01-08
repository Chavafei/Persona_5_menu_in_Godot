shader_type canvas_item;

uniform sampler2D transition_pattern;
uniform float transition_state : hint_range(0.0, 1.0) = 0;

void fragment() {
	COLOR = texture(TEXTURE,UV);
	float pattern_val = texture(transition_pattern, UV).r;
	COLOR.a *= step(transition_state, pattern_val);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
