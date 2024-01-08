shader_type canvas_item;

uniform vec2 tiling = vec2(1.,1.);
uniform vec2 offset = vec2(0.,0.);
uniform float rotate = 0.0;
uniform float frequency = 5.0;
uniform float star_size = 1.0;
uniform float sine_speed = 5.0;
uniform float sharpness = 1.;
uniform vec4 white_color : source_color = vec4(1.0,1.0,1.0,1.0); 
uniform vec4 black_color : source_color; 

float polarStar( in vec2 p )
{
    const float pi5 = 0.628318530718; // pi/5
    //const float ph2 = 3.2360679775; // 2 * phi

   
	
    float m2 = mod(atan(p.y, p.x)/pi5 + 1.0, 2.0);
    float adjust = -sharpness;
	
    return length(p) * cos((pi5 * adjust) * (m2 - 4.0 * step(1.0, m2) + 1.0)) - 1.0;
}


void fragment() {
	vec2 iResolution = 1.0/ TEXTURE_PIXEL_SIZE;
	vec2 fragCoord = UV;
	float iTime = TIME;
	vec4 fragColor = COLOR;
	
	vec2 uv = UV - 0.5 + offset;
	uv = uv * (2.0 + tiling);
	
	float t = 0.94 + rotate;
	uv = mat2(vec2(cos(t), -sin(t)),vec2(sin(t), cos(t))) * uv;
	//float d = sdStar5(uv,1.,0.5);
	float d = polarStar(uv) * 5.;
	
	d = sin(d*frequency + iTime * sine_speed) / 10.0;
	//d= abs(d);
	
	d = smoothstep(0.0,0.0,d);
	
	
	float clip = polarStar(uv * 5. * star_size);
	clip = smoothstep(1.0,1.0,clip);
	
	d = d-clip;
	
	vec4 white_col = vec4(d,d,d,d) * white_color;
	vec4 black_col = (1.0-vec4(d,d,d,d + clip)) * black_color;
	
	COLOR = COLOR * white_col + black_col;
	
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
