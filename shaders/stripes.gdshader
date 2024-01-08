shader_type canvas_item;

uniform vec2 tiling = vec2(1,1);
uniform vec2 move_vector = vec2(0,0);
uniform float speed = 0.5;
uniform float rotate;
uniform float line_thickness = 0.2;
uniform vec4 line_color : source_color;

vec2 rotateCoord(vec2 uv, float rads) {
    uv *= mat2(vec2(cos(rads), sin(rads)) , vec2(-sin(rads), cos(rads)));
	return uv;
}

void vertex() {
	// Called for every vertex the material is visible on.
}

float sdBox(in vec2 p, in vec2 b)
{
    vec2 d = abs(p) - b;
    return length(max(d, vec2(0.0))) + min(max(d.x, d.y), 0.0);
 	   
    
}

void fragment() {
	vec2 iResolution = TEXTURE_PIXEL_SIZE;
	vec2 fragCoord = UV * tiling + move_vector * TIME * speed;
	fragCoord = rotateCoord(fragCoord,rotate);
	float iTime = TIME * 0.5;
	vec4 fragColor = COLOR;
	
	
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    
    uv = 10.0*uv;
    uv = fract(uv);
	
    
    vec2 box = uv - vec2(line_thickness, 1.0);
    float distBox = sdBox(box, vec2(line_thickness, 1.0));    
    // 1. Black disk in white background:
    //vec3 col = vec3(1.0) * sign(distCircle);

    // 2. Red disk on blue background:
    vec3 col = vec3(1.0) * sign(distBox);
    col = col*-1.0;
    // Output to screen
    COLOR = vec4(col,col.r) * line_color;
}



//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
