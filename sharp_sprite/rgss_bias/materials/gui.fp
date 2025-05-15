#version 140

#include "/sharp_sprite/rgss/rgss.glsl"

in highp vec2 var_texcoord0;
in mediump vec4 var_color;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;

void main()
{
    out_fragColor = rgss_tex2D(texture_sampler, var_texcoord0.xy, -1.0) * var_color;
}
