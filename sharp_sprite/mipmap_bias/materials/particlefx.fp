varying mediump vec2 var_texcoord0;
varying mediump vec4 var_color;

uniform mediump sampler2D texture_sampler;
uniform mediump vec4 tint;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    mediump vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    // var_color is vertex color from the particle system, pre-multiplied in vertex program
    gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy, -1.0) * var_color * tint_pm;
}
