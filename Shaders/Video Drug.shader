shader_type canvas_item;
//replace "blend_mix" with "blend_add" or "blend_sub" or "blend_mul" to change blend mode
render_mode blend_mix;

//these are variables
uniform float time_factor = 0;
uniform vec2 amplitude = vec2(0,0);
uniform float frequency = 0;
uniform float scale = 2.0;
uniform vec2 move = vec2(0,0);
uniform float colour_time = 0;
//variable above me is only for if you wanna use color cycling
uniform sampler2D palette;

 void fragment(){
    vec2 newuv = UV;
	//tbh i dont know how to explain what it does, ill just say it makes the background move
	newuv.x += amplitude.x * sin(frequency + newuv.y + scale * TIME * time_factor);
	newuv.y += amplitude.y * sin(frequency + newuv.x + scale * TIME * time_factor);
	//this one i can explain, it moves the texture to up and right using postives, down and left using negetives
	//the higher the number the faster it is
	newuv.x += TIME * move.x;
	newuv.y += TIME * move.y;
    vec4 c = texture(TEXTURE, newuv);
    COLOR = c;
	float ccycle = mod(c.r - TIME * colour_time, 1.0);
	//remove the slashes from the codes above me to enable color cycling (MAKE SURE YOU HAVE A COLOUR PALETTE)
	//COLOR = vec4(texture(palette, vec2(ccycle, 0)).rgb, c.a);
}