shader_type spatial;

uniform vec4 color: hint_color = vec4(0.4, 0.4, 0.4, 1.0);
uniform float opacity_multiplier = 1.0;
uniform float energy = 1.0;

void fragment() {
	ALBEDO = color.rgb;
	ALPHA = (1.0 - UV.y) * opacity_multiplier;
	EMISSION = color.rgb * energy;
}