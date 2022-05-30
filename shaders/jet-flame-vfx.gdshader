shader_type spatial;
render_mode cull_disabled;

uniform float thrust;
uniform bool use_jiggle;
uniform vec2 noise_tiling;
uniform float noise_speed;
uniform float engine_power;
uniform float jiggle_strength;
uniform sampler2D noise_texture;
uniform vec4 flame_color_a : hint_color;
uniform vec4 flame_color_b : hint_color;

float _clamp(float val, float lb, float ub) {
	if (val < lb)         { return lb; }
	else if (val > ub)    { return ub; }
	return val;
}

// Helped to remap the thrust to a 0 - 1 range. 
float remap(float x) {
	float localFactor = x - 0.5 / (1.2 - 0.3);
	float targetRange = 1.4 - 0.0;
	return localFactor * targetRange;
}

void fragment() {
	vec2 uv_offset;
	vec2 uv_tiling;
	vec4 _color;

	uv_tiling = noise_tiling * vec2(1.0, 0.2);
	uv_offset = TIME * vec2(0.2, 1.0) * noise_speed;

	vec2 modUV = (UV * uv_tiling) + uv_offset;
	vec4 noise_col = texture(noise_texture, modUV);
	
	float _noise = noise_col.a;
	float _gradient = UV.y - (remap(thrust) * 4.0) * -1.0;
	float _alpha = (_noise + _gradient) * engine_power;
	
	_alpha = _clamp(_alpha, 0.0, 1.0);
	_color = mix(flame_color_a, flame_color_b, _gradient);
	
	ALPHA = _alpha;
	EMISSION = _color.rgb;
}

void light() {
	
}
void vertex() {
	
}
