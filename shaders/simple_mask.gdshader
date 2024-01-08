shader_type canvas_item;

uniform sampler2D target_mask ;
uniform sampler2D omit_mask;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    COLOR = texture(target_mask, SCREEN_UV);
    COLOR.a = texture(TEXTURE, UV).a;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
