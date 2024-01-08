shader_type canvas_item;

uniform vec2 tiling = vec2(1,1);
uniform vec2 offset = vec2(0,0);
uniform float speed = 6 ;//if negative, will go inward
uniform float size = 6;
uniform float center_distance = 50.0;
uniform float thickness = 0.0;
uniform float smoothness = 0;
uniform vec4 line_color : source_color;
uniform vec4 back_color : source_color;

uniform float test_var = 0.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	
	vec2 iResolution = TEXTURE_PIXEL_SIZE;
	vec2 fragCoord = UV * tiling + offset;
	float iTime = TIME;
	vec4 fragColor = COLOR;
	
	vec2 coord = fragCoord.xy * 1000.0;
    vec2 center = iResolution.xy /2.0;
    float dist = length(center - coord);
    float circlesOut = cos(dist/size - iTime*speed);
	//circlesOut = smoothstep(circlesOut,1.0,0.0 + 0.5);
	circlesOut = smoothstep(-smoothness,smoothness, circlesOut - -thickness);

	//circlesOut = smoothstep(circlesOut,0.0 - (line_gap/10.0),1);
    //circlesOut *= 5.0;
    circlesOut = clamp(circlesOut,0.0,1);
    float edge = clamp(dist-center_distance,0.0,1.0);
    circlesOut *= edge;
    //float c = circlesOut + circlesIn;
	float c = circlesOut;
	COLOR = vec4(c,c,c,c) * line_color;
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
