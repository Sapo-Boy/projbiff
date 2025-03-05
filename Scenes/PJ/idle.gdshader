shader_type canvas_item;

void fragment() {
	vec2 uv = UV;
	
	float frequency = 5.0;
	float amplitude = 0.01;
	float speed = 1.4;
	float idle = sin(uv.y * frequency + TIME * speed) * amplitude;
	
	uv.y += idle;
	
	COLOR = texture(TEXTURE, uv);
	COLOR.b = 0.7;
	COLOR.a = 0.1;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
