varying mediump vec2 var_texcoord0;
varying mediump vec4 var_color;

uniform mediump sampler2D texture_sampler;

void main()
{
    mediump vec4 tex = texture2D(texture_sampler, var_texcoord0.xy, -1.0);
    gl_FragColor = tex * var_color;
}
