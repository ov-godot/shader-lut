shader_type canvas_item;
uniform sampler2D screen_texture : source_color, hint_screen_texture, repeat_disable, filter_linear_mipmap;
uniform bool lut_enabled = true;
uniform sampler2D lut_texture : source_color, filter_linear_mipmap;
uniform vec2 lut_grid = vec2(8.0, 8.0);

void fragment() {
    vec4 screen_texel = texture(screen_texture, SCREEN_UV);
    if (!lut_enabled) COLOR = vec4(0);
    else {
        float index = screen_texel.b*((lut_grid.x*lut_grid.y) - 1.0);
        float index_min = min(62.0, floor(index));
        float index_max = index_min + 1.0;
        vec2 tileIndex_min;
        tileIndex_min.y = floor(index_min/lut_grid.x);
        tileIndex_min.x = floor(index_min - (tileIndex_min.y*lut_grid.x));
        vec2 tileIndex_max;
        tileIndex_max.y = floor(index_max/lut_grid.x);
        tileIndex_max.x = floor(index_max - (tileIndex_max.y*lut_grid.x));
        vec2 tileUV = mix(vec2(0.5/(lut_grid.x*lut_grid.y)), ((lut_grid.x*lut_grid.y) - vec2(0.5))/(lut_grid.x*lut_grid.y), screen_texel.rg)/lut_grid;
        vec3 color_min = texture(lut_texture, (tileIndex_min/lut_grid) + tileUV).rgb;
        vec3 color_max = texture(lut_texture, (tileIndex_max/lut_grid) + tileUV).rgb;
        vec3 color = mix(color_min, color_max, index - index_min);
        COLOR.rgb = color_min;
        COLOR.a = 1.0;
    }
}