
library tex_image_and_sub_image_2d_with_image;

import 'dart:html';
import 'dart:web_gl' as wgl;
import 'webgl-test.dart';
import 'webgl-test-utils.dart' as wtu;
import "../../../../testcommon.dart";

generateTest(pixelFormat, pixelType, pathToTestRoot, prologue) {
  var gl = null;
  var textureLoc = null;
  var imgCanvas;
  var red = [255, 0, 0];
  var green = [0, 255, 0];

  runOneIteration(image, useTexSubImage2D, flipY, topColor, bottomColor)
  {
    debug('Testing ' + (useTexSubImage2D ? 'texSubImage2D' : 'texImage2D') +
        ' with flipY=$flipY');
    gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
    // Disable any writes to the alpha channel
    gl.colorMask(true, true, true, false);
    var texture = gl.createTexture();
    // Bind the texture to texture unit 0
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    // Set up texture parameters
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);
    // Set up pixel store parameters
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, flipY ? 1 : 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_COLORSPACE_CONVERSION_WEBGL, wgl.WebGL.NONE);
    // Upload the image into the texture
    if (useTexSubImage2D) {
      // Initialize the texture to black first
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, pixelFormat, image.width, image.height, 0,
          pixelFormat, pixelType, null);
      gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, pixelFormat, pixelType, image);
    } else {
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, pixelFormat, pixelFormat, pixelType, image);
    }

    // Point the uniform sampler to texture unit 0
    gl.uniform1i(textureLoc, 0);
    // Draw the triangles
    wtu.drawQuad(gl, [0, 0, 0, 255]);
    // Check a few pixels near the top and bottom and make sure they have
    // the right color.
    debug("Checking lower left corner");
    wtu.checkCanvasRect(gl, 4, 4, 2, 2, bottomColor,
        "shouldBe $bottomColor");
    debug("Checking upper left corner");
    wtu.checkCanvasRect(gl, 4, gl.canvas.height - 8, 2, 2, topColor,
        "shouldBe $topColor");
  }

  runTestOnImage(image) {
    runOneIteration(image, false, true, red, green);
    runOneIteration(image, false, false, green, red);
    runOneIteration(image, true, true, red, green);
    runOneIteration(image, true, false, green, red);
  }

  runTest3(image) {
    runTestOnImage(image);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "should be no errors");
    asyncEnd();
  }

  runTest2(image) {
    runTestOnImage(image);

    dynamic newImage = document.createElement("img");
    newImage.onLoad.listen((_) {
      runTest3(newImage);
    });
    newImage.src = imgCanvas.toDataUrl();
  }

  runTest(image) {
    runTestOnImage(image);

    imgCanvas = document.createElement("canvas");
    imgCanvas.width = 1;
    imgCanvas.height = 2;
    var imgCtx = imgCanvas.getContext("2d");
    var imgData = imgCtx.createImageData(1, 2);
    imgData.data[0] = red[0];
    imgData.data[1] = red[1];
    imgData.data[2] = red[2];
    imgData.data[3] = 255;
    imgData.data[4] = green[0];
    imgData.data[5] = green[1];
    imgData.data[6] = green[2];
    imgData.data[7] = 255;
    imgCtx.putImageData(imgData, 0, 0);

    // apparently Image is different than <img>.
    var newImage =  new ImageElement();
    newImage.onLoad.listen((_) {
      runTest2(newImage);
    });
    newImage.src = imgCanvas.toDataUrl();
  }

  var init = ()
  {
    debug('Verify texImage2D and texSubImage2D code paths taking image elements ($pixelFormat/$pixelType)');

    gl = wtu.create3DContext("example");

    if (!prologue(gl)) {
      asyncEnd();
      return;
    }

    var program = wtu.setupTexturedQuad(gl);

    gl.clearColor(0,0,0,1);
    gl.clearDepth(1);

    textureLoc = gl.getUniformLocation(program, "tex");

    wtu.loadTexture(gl, pathToTestRoot + "/resources/red-green.png", runTest);
    asyncStart();
  };

  return init;
}
