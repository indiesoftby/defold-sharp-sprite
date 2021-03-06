[![Sharp Sprite Logo](cover.png)](https://github.com/indiesoftby/defold-sharp-sprite)

# Sharp Sprite - RGSS for Defold

Sharp Sprite is the implementation of *Rotated Grid Super-Sampling (RGSS)* for the [Defold](https://defold.com/) engine. If you use down-scaled high-resolution images in your game and you want to get rid of blurriness (because of mipmapping) or sharpness (because of disabled mipmapping), then RGSS is for you:

![RGSS vs Builtin](rgss_vs_builtin.gif)

How does it work? RGSS samples the texture multiple times with an offset on each sample and averages the results. For this, it uses a 4x MSAA rotated grid pattern, sometimes called 4 rooks.

Also, **[check out the demo](https://indiesoftby.github.io/defold-sharp-sprite/)**.

## Installation

You can use it in your own project by adding this project as a [Defold library dependency](http://www.defold.com/manuals/libraries/). Open your `game.project` file and in the dependencies field under project add:

https://github.com/indiesoftby/defold-sharp-sprite/archive/main.zip

Or point to the ZIP file of a [specific release](https://github.com/indiesoftby/defold-sharp-sprite/releases).

Sharp Sprite contains materials that are drop-in replacement for the standard 2D materials:

- `/builtins/materials/gui.material` → `/sharp_sprite/materials/gui.material`
- `/builtins/materials/particlefx.material` → `/sharp_sprite/materials/particlefx.material`
- `/builtins/materials/spine.material` → `/sharp_sprite/materials/spine.material`
- `/builtins/materials/sprite.material` → `/sharp_sprite/materials/sprite.material`
- `/builtins/materials/tile_map.material` → `/sharp_sprite/materials/tile_map.material`
- `/builtins/fonts/font.material` → `/sharp_sprite/fonts/font.material` or `/sharp_sprite/fonts/font-singlelayer.material`
- `/builtins/fonts/font-fnt.material` → `/sharp_sprite/fonts/font-fnt.material`
- `/builtins/fonts/label.material` → `/sharp_sprite/fonts/label.material` or `/sharp_sprite/fonts/label-singlelayer.material`
- `/builtins/fonts/label-fnt.material` → `/sharp_sprite/fonts/label-fnt.material`

## Cons

- RGSS requires the [OES_standard_derivatives](https://www.khronos.org/registry/OpenGL/extensions/OES/OES_standard_derivatives.txt) OpenGL extension to run. It's universally supported by WebGL 1.0, by the most of OpenGL ES 2.0 devices ([Android stats](https://opengles.gpuinfo.org/listreports.php?extension=GL_OES_standard_derivatives) and by all [iOS devices](https://developer.apple.com/library/archive/documentation/OpenGLES/Conceptual/OpenGLESHardwarePlatformGuide_iOS/OpenGLESPlatforms/OpenGLESPlatforms.html)).
- RGSS is sampling the texture 4 times. On mobile GPUs, it can have a significant performance impact. You should always check the game performance on your target devices!
- Sharp Sprite's implementation of RGSS is blurring at 1:1 scaling.

## Tips

- RGSS doesn't use mipmapped textures. You can turn off the mipmapping in your texture profile and save 30% of disk space.
- If your sprites use both Defold standard and Sharp Sprite materials, then it's a good idea to split them by tags to avoid breaking of draw batching:
   1. Copy Sharp Sprite material to your project and [apply tag `tile_rgss` into it.](tile_rgss_1.png)
   2. [Modify your render script to draw the tagged sprites.](tile_rgss_2.png)

## Credits

Based on an original idea by Ben Golus - **[Sharper Mipmapping using Shader Based Supersampling](https://medium.com/@bgolus/sharper-mipmapping-using-shader-based-supersampling-ed7aadb47bec)**.

The snake image is from [Kenney](https://kenney.nl/).
