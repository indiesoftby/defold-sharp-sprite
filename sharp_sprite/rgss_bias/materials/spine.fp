#extension GL_OES_standard_derivatives : enable

varying highp vec2 var_texcoord0;
varying mediump vec4 var_color;

uniform mediump sampler2D texture_sampler;
uniform mediump vec4 tint;

// Rotated grid UV offsets
const mediump vec2 rgss_uv_offsets = vec2(0.125, 0.375);

mediump vec4 rgss_tex2D(mediump sampler2D tex, highp vec2 uv)
{
    // Per pixel partial derivatives
    mediump vec2 dx = dFdx(uv);
    mediump vec2 dy = dFdy(uv);

    // Supersampled using 2x2 rotated grid
    mediump vec4 col = texture2D(tex, vec2(uv + rgss_uv_offsets.x * dx + rgss_uv_offsets.y * dy), -1.0);
    col += texture2D(tex, vec2(uv - rgss_uv_offsets.x * dx - rgss_uv_offsets.y * dy), -1.0);
    col += texture2D(tex, vec2(uv + rgss_uv_offsets.y * dx - rgss_uv_offsets.x * dy), -1.0);
    col += texture2D(tex, vec2(uv - rgss_uv_offsets.y * dx + rgss_uv_offsets.x * dy), -1.0);

    col *= 0.25;

    return col;
}

void main()
{
    // Pre-multiply alpha since var_color and all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    mediump vec4 color_pm = var_color * tint_pm;
    gl_FragColor = rgss_tex2D(texture_sampler, var_texcoord0.xy) * color_pm;
}
