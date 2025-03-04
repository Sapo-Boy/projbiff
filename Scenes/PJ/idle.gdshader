shader_type canvas_item;

void fragment() {
	vec2 uv = UV;
	
	float frequency = 5.0;
	float amplitude = 0.01;
	float speed = 0.4;
	float idle = sin(uv.y * frequency + TIME * speed) * amplitude;
	
	uv.x += idle;
	
	COLOR = texture(TEXTURE, uv);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
