shader_type canvas_item;

// can be used on colorrect to overlay on top

group_uniforms Distortion;
uniform sampler2D screen_texture : hint_screen_texture,repeat_disable;

uniform vec2 distortion_tiling = vec2(1,1);
uniform vec2 distortion_offset_speed = vec2(1,1);
uniform float distortion_intensity = 1.0;
uniform sampler2D noiseTexture:repeat_enable;


void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	vec2 iResolution = TEXTURE_PIXEL_SIZE;
	vec2 fragCoord = UV;
	float iTime = TIME;
	vec4 fragColor = COLOR;
	vec2 uv = SCREEN_UV;


	
	vec4 noise_color = texture(noiseTexture,SCREEN_UV + distortion_offset_speed * TIME);
	vec4 color = texture(screen_texture,SCREEN_UV + (noise_color.b/20.0 * distortion_intensity));
	
	

	COLOR = color;
	
		// Get the pixel color at the index.
	//vec4 color = texture(screen_texture, SCREEN_UV);
	//
	//color.g = 0.0;
	//COLOR = color;
	
	
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
