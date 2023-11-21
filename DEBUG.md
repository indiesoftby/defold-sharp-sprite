### How to test shaders without the `OES_standard_derivatives` extension

```js
[window.WebGLRenderingContext].forEach(function(context) {
    if (!context) return;

    var getSupportedExtensionsOld = context.prototype.getSupportedExtensions;
    context.prototype.getSupportedExtensions = function() {
        var arr = getSupportedExtensionsOld.call(this);
        var index = arr.indexOf("OES_standard_derivatives");
        if (index > -1) {
            arr.splice(index, 1);
        }

        return arr;
    };

    var getExtensionOld = context.prototype.getExtension;
    context.prototype.getExtension = function(name) {
        if (name == "OES_standard_derivatives") {
            return null;
        }
        return getExtensionOld.call(this, name);
    };
});
```
