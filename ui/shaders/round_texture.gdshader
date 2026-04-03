shader_type canvas_item;

uniform float radius = 20.0;

void fragment() {
    vec2 size = vec2(textureSize(TEXTURE, 0));
    vec2 uv_pixel = UV * size;

    vec2 dist = min(uv_pixel, size - uv_pixel);
    float alpha = smoothstep(0.0, radius, min(dist.x, dist.y));

    vec4 tex = texture(TEXTURE, UV);
    COLOR = vec4(tex.rgb, tex.a * alpha);
}