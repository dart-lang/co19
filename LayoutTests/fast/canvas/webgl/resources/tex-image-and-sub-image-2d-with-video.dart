
library tex_image_and_sub_image_2d_with_video;

import 'dart:html';
import 'dart:web_gl' as wgl;
import 'webgl-test.dart';
import 'webgl-test-utils.dart' as wtu;
import "../../../../testcommon.dart";

generateTest(pixelFormat, pixelType, prologue) {
  var gl = null;
  var textureLoc = null;

  runOneIteration(videoElement, useTexSubImage2D, flipY, topColor, bottomColor)
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
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_S, wgl.WebGL.CLAMP_TO_EDGE);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_WRAP_T, wgl.WebGL.CLAMP_TO_EDGE);
    // Set up pixel store parameters
    gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, flipY ? 1 : 0);
    gl.pixelStorei(wgl.WebGL.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 0);
    // Upload the videoElement into the texture
    if (useTexSubImage2D) {
      // Initialize the texture to black first
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, pixelFormat,
          videoElement.videoWidth, videoElement.videoHeight, 0,
          pixelFormat, pixelType, null);
      gl.texSubImage2D(wgl.WebGL.TEXTURE_2D, 0, 0, 0, pixelFormat, pixelType, videoElement);
    } else {
      gl.texImage2D(wgl.WebGL.TEXTURE_2D, 0, pixelFormat, pixelFormat, pixelType, videoElement);
    }

    dynamic c = document.createElement("canvas");
    c.width = 16;
    c.height = 16;
    c.style.border = "1px solid black";
    var ctx = c.getContext("2d");
    ctx.drawImageScaled(videoElement, 0, 0, 16, 16);
    document.body.append(c);

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

  runTest(videoElement)
  {
    var red = [255, 0, 0];
    var green = [0, 255, 0];
    runOneIteration(videoElement, false, true, red, green);
    runOneIteration(videoElement, false, false, green, red);
    runOneIteration(videoElement, true, true, red, green);
    runOneIteration(videoElement, true, false, green, red);

    glErrorShouldBe(gl, wgl.WebGL.NO_ERROR, "should be no errors");
  }

  var init = ()
  {
    debug('Verify texImage2D and texSubImage2D code paths taking video elements ($pixelFormat/$pixelType)');

    gl = wtu.create3DContext("example");

    if (!prologue(gl)) {
      return;
    }

    var program = wtu.setupTexturedQuad(gl);

    gl.clearColor(0,0,0,1);
    gl.clearDepth(1);

    textureLoc = gl.getUniformLocation(program, "tex");

    dynamic video = document.getElementById("vid");
    video.addEventListener(
        "playing", (_) {
          runTest(video);
          asyncEnd();
        }, true);
    video.loop = true;
    asyncStart();
    video.play();
  };

  return init;
}
