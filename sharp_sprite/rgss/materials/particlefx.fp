#version 140

#include "/sharp_sprite/rgss/rgss.glsl"

in highp vec2 var_texcoord0;
in mediump vec4 var_color;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;
uniform fs_uniforms
{
    mediump vec4 tint;
};

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    // var_color is vertex color from the particle system, pre-multiplied in vertex program
    out_fragColor = rgss_tex2D(texture_sampler, var_texcoord0.xy, 0.0) * var_color * tint_pm;
}
