varying mediump vec2 var_texcoord0;
varying mediump vec4 var_color;

uniform mediump sampler2D texture_sampler;
uniform mediump vec4 tint;

void main()
{
    // Pre-multiply alpha since var_color and all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    mediump vec4 color_pm = var_color * tint_pm;
    gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy, -1.0) * color_pm;
}
