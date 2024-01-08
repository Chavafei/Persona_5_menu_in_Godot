shader_type canvas_item;

//Modification of the shader https://www.shadertoy.com/view/ss3fDf by arma

// This is a polka fading dots shader, put it on 2D material

#define ZOOM 1.0
uniform vec2 tiling = vec2(1,1);
uniform float dots_size = 1;
uniform float pattern_offset = 1.0;
uniform float grid = 5.0;
uniform float speed = 0.5;
uniform vec2 move_vector = vec2(1,1);
uniform sampler2D maskTexture;
uniform vec4 dots_color : source_color;
uniform bool invert = false;



//const float PI = 3.14;

mat2 rotationMatrix(float angle)
{
	angle *= PI / 180.0;
    float s=sin(angle), c=cos(angle);
    return mat2 ( vec2(c, -s), vec2(s, c ));
}

void fragment()
{
	vec2 iResolution = TEXTURE_PIXEL_SIZE;
	vec2 fragCoord = UV * tiling;
	float iTime = TIME;
	vec4 fragColor = COLOR;
	
    

    vec2 uv = fragCoord/iResolution.y*grid;
    vec2 uvSpace = fragCoord/iResolution.x;
    
    uv.x -= iTime * grid / 5.0 * speed * move_vector.x;
    uv.y -= iTime * grid / 5.0 * speed * move_vector.y;
    
    uv *= rotationMatrix(45.0 * pattern_offset) * ZOOM;
    
    uv = fract(uv);
	float texture_mask;

	texture_mask = texture(maskTexture, UV).r;
   
	
    float radius = mix(0.0,2.0,length(texture_mask)) * dots_size;
    
    vec2 uv1 = (uv - vec2(0.5)) * 2.0 - 1.0;
    vec2 uv2 = (uv + vec2(0.5)) * 2.0 - 1.0;
    vec2 uv3 = (uv - vec2(0.5,-0.5)) * 2.0 - 1.0;
    vec2 uv4 = (uv - vec2(-0.5,0.5)) * 2.0 - 1.0;
    
    float distance1 = length(uv1);
    float distance2 = length(uv2);
    float distance3 = length(uv3);
    float distance4 = length(uv4);

    float d1 = smoothstep(radius, radius - 3.0, distance1);
    float d2 = smoothstep(radius, radius - 3.0, distance2);
    float d3 = smoothstep(radius, radius - 3.0, distance3);
    float d4 = smoothstep(radius, radius - 3.0, distance4);
    
    vec3 color = mix(vec3(0), vec3(1),abs(smoothstep(0.001,0.005,(d1-.01))));
    color = mix(color,vec3(1),abs(smoothstep(0.001,0.005,(d2-.01))));
    color = mix(color,vec3(1),abs(smoothstep(0.001,0.005,(d3-.01))));
    color = mix(color,vec3(1),abs(smoothstep(0.001,0.005,(d4-.01))));
	
	if(invert){
		color = vec3(1.0 - color.rgb);
	}

    COLOR = vec4(color,color.r) * dots_color;
	
}