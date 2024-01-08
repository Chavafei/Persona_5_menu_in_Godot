shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

uniform sampler2D iChannel0;
uniform vec4 albedo_color: source_color = vec4(1.0);
uniform vec2 resolution = vec2(600,400);

uniform float testervalue;

void fragment() {
	vec2 iResolution = resolution / TEXTURE_PIXEL_SIZE;
	vec4 fragColor = albedo_color;
	vec2 fragCoord = UV  * resolution;
	float iTime = TIME;
	
	
	vec2 p = fragCoord.xy / iResolution.xy;

	float aspectCorrection = (iResolution.x/iResolution.y);
	vec2 coordinate_entered = 2.0 * p - 1.0;
	vec2 coord = vec2(aspectCorrection,1.0) *coordinate_entered;
	float vignette = 1.0 / max(0.25 + 0.34*dot(coord,coord),1.);
    
    vec2 unreal=coord;
    unreal*=4.-0.1*iTime+sin(iTime)*.1;
    float beat = mod(iTime,1.);
    unreal *= vec2(sin(beat+unreal.y+iTime*.01)*0.05*beat+1.,cos(beat*.01*1.121+unreal.x)*0.05*beat+1.);
    unreal.x = mod(unreal.x,.5)-0.35;
    unreal.y = mod(unreal.y,.5)-0.35;
    float sizer1 = 1.+abs(coord.y*1.2);
    vec3 rgb = vec3(0.1)-.1*mod(fragCoord.x+fragCoord.y,4.);
    rgb += vec3(max(min(floor(length(unreal)*10.*sizer1),1.),0.));
    rgb *= vec3(max(min(floor(length(unreal+vec2(.25))*10.*sizer1),1.),0.));
    rgb = vec3(min(max(rgb.r,0.),1.),min(max(rgb.g,0.),1.),min(max(rgb.b,0.),1.));
    rgb -= vec3(0.9,0.5,-0.);
    
    
    vec2 cyclicmovement = vec2(cos(iTime*1.121),sin(iTime*1.121));
	//vec2 cyclicmovement = vec2(1,1);
	
    vec2 magicCoord = cyclicmovement+coord*length(coord+cyclicmovement*mod(iTime*2.,4.));
    float s=texture(iChannel0,magicCoord).r*.1;
    if(length(coord+s)*(.7+.1*sin(iTime))<.3)
        rgb = vec3(1.0,.75,.2);
    else 
        rgb += vec3(.11);
    rgb += vec3(1.1-min(mod(floor(length(coord)*(2.3+mod(floor(iTime)+length(coord)*2.121,4.)))+iTime,4.),1.));
	COLOR = vec4(rgb*vignette
         				,1.0);
}

void polkaDots(){
	
	
}