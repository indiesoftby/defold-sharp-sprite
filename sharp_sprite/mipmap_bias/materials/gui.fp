#version 140

in highp vec2 var_texcoord0;
in mediump vec4 var_color;

out vec4 out_fragColor;

uniform mediump sampler2D texture_sampler;

void main()
{
    out_fragColor = texture(texture_sampler, var_texcoord0.xy, -1.0) * var_color;
}
