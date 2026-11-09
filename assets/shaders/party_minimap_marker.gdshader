shader_type spatial;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float dist = length(UV - vec2(0.5));
	float radius = 0.5;
	if (dist < radius) {
		ALBEDO = vec3(0.0,0.0,1.0);
	}
	else {
		discard;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
