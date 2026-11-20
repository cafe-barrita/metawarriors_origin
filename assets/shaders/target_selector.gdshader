shader_type spatial;

uniform bool use_gradient = false;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	float dist = length(UV - vec2(0.5));
	float radius = 0.5;
	if (dist < radius) {
		if (use_gradient) {
			// TODO gradiant thingy
			ALBEDO = vec3(1.0,1.0,1.0);
		}
		else {
			ALBEDO = vec3(1.0,1.0,1.0);
		}
	}
	else {
		discard;
	}
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
