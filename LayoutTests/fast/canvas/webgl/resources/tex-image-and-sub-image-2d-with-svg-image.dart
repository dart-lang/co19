
library tex_image_and_sub_image_2d_with_svg_image;

import 'dart:svg' as svg;
import 'dart:web_gl' as wgl;
import 'webgl-test-utils.dart' as wtu;
import "../../../../testcommon.dart";

generateTest(pixelFormat, pixelType, pathToTestRoot, prologue) {
  var gl = null;
  var textureLoc = null;
  var red = [255, 0, 0];
  var green = [0, 255, 0];


  runOneIteration(image, useTexSubImage2D, flipY, topColor, bottomColor)
  {
    debug('Testing ' + (useTexSubImage2D ? 'texSubImage2D' : 'texImage2D') +
        ' with flipY=$flipY');
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    var texture = gl.createTexture();
    // Bind the texture to texture unit 0.
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    // Set up texture parameters.
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
    // Set up pixel store parameters.
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, flipY ? 1 : 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.WebGL.NONE);
    // Upload the image into the texture.
    if (useTexSubImage2D) {
      // Initialize the texture to black first.
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, pixelFormat, image.width, image.height, 0,
          pixelFormat, pixelType, null);
      gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, pixelFormat, pixelType, image);
    } else
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, pixelFormat, pixelFormat, pixelType, image);

    // Point the uniform sampler to texture unit 0.
    gl.uniform1i(textureLoc, 0);
    // Draw the triangles.
    wtu.drawQuad(gl, [0, 255, 0, 255]);
    // Check a few pixels near the top and bottom and make sure they have
    // the right color.
    debug("Checking lower left corner");
    wtu.checkCanvasRect(gl, 4, 4, 2, 2, bottomColor,
        "shouldBe $bottomColor");
    debug("Checking upper left corner");
    wtu.checkCanvasRect(gl, 4, gl.canvas.height - 8, 2, 2, topColor,
        "shouldBe $topColor");
  }

  runTest(image)
  {
    runOneIteration(image, false, true, red, green);
    runOneIteration(image, false, false, green, red);
    runOneIteration(image, true, true, red, green);
    runOneIteration(image, true, false, green, red);
  }

  var init = ()
  {
    debug('Verify texImage2D and texSubImage2D code paths taking SVG image elements');

    gl = wtu.create3DContext("example");

    if (!prologue(gl)) {
      //asyncEnd();
      return;
    }

    var program = wtu.setupTexturedQuad(gl);

    gl.clearColor(0,0,0,1);
    gl.clearDepth(1);

    textureLoc = gl.getUniformLocation(program, "tex");

    //asyncStart();

    /*var image = new svg.ImageElement();
    image.width = 10;
    image.height = 10;
    image.onLoad.listen((_) {
      runTest(image);
      asyncEnd();
    });
    image.src = pathToTestRoot + "/resources/red-green.svg";*/

    var svgElt = new svg.SvgElement.svg('''
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
        <image>
          <rect fill="#ff0000" x="0" y="0" width="100" height="50"/>
          <rect fill="#00ff00" x="0" y="50" width="100" height="50"/>
        </image>
      </g>''');
    var image = svgElt.querySelector('image');

    runTest(image);
  };

  return init;
}
