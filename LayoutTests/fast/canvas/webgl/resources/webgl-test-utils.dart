/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// Copyright (c) 2011 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library webgl_test_utils;

import 'dart:html';
import 'dart:web_gl' as wgl;
import 'dart:typed_data';
import "../../../../testcommon.dart";
import "pwd.dart";

getBasePath() => '$root/';

/**
 * Wrapped logging function.
 * @param {string} msg The message to log.
 */
var log = (msg) {
    window.console.log(msg);
};

/**
 * Wrapped logging function.
 * @param {string} msg The message to log.
 */
var error = (msg) {
  window.console.error(msg);
};

/**
 * Turn off all logging.
 */
loggingOff() {
  log = (_) {};
  error = (_) {};
}

/**
 * Converts a WebGL enum to a string
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} value The enum value.
 * @return {string} The enum as a string.
 */
glEnumToString(gl, value) {
  //TODO some verbose reporting for dart

  /*for (var p in gl) {
    if (gl[p] == value) {
      return p;
    }
  }*/
  return "0x" + value.toRadixString(16);
}

var lastError = "";

/**
 * Returns the last compiler/linker error.
 * @return {string} The last compiler/linker error.
 */
getLastError() {
  return lastError;
}

/**
 * Whether a haystack ends with a needle.
 * @param {string} haystack String to search
 * @param {string} needle String to search for.
 * @param {boolean} True if haystack ends with needle.
 */
endsWith(haystack, needle) {
  return haystack.endsWith(needle);
}

/**
 * Whether a haystack starts with a needle.
 * @param {string} haystack String to search
 * @param {string} needle String to search for.
 * @param {boolean} True if haystack starts with needle.
 */
startsWith(haystack, needle) {
  return haystack.startsWith(needle);
}

/**
 * A vertex shader for a single texture.
 * @type {string}
 */
var simpleTextureVertexShader = [
  'attribute vec4 vPosition;',
  'attribute vec2 texCoord0;',
  'varying vec2 texCoord;',
  'void main() {',
  '    gl_Position = vPosition;',
  '    texCoord = texCoord0;',
  '}'].join('\n');

/**
 * A fragment shader for a single texture.
 * @type {string}
 */
var simpleTextureFragmentShader = [
  'precision mediump float;',
  'uniform sampler2D tex;',
  'varying vec2 texCoord;',
  'void main() {',
  '    gl_FragData[0] = texture2D(tex, texCoord);',
  '}'].join('\n');

/**
 * A vertex shader for a single texture.
 * @type {string}
 */
var simpleColorVertexShader = [
  'attribute vec4 vPosition;',
  'void main() {',
  '    gl_Position = vPosition;',
  '}'].join('\n');

/**
 * A fragment shader for a color.
 * @type {string}
 */
var simpleColorFragmentShader = [
  'precision mediump float;',
  'uniform vec4 u_color;',
  'void main() {',
  '    gl_FragData[0] = u_color;',
  '}'].join('\n');

/**
 * Creates a simple texture vertex shader.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @return {!WebGLShader}
 */
setupSimpleTextureVertexShader(gl) {
    return loadShader(gl, simpleTextureVertexShader, wgl.WebGL.VERTEX_SHADER);
}

/**
 * Creates a simple texture fragment shader.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @return {!WebGLShader}
 */
setupSimpleTextureFragmentShader(gl) {
    return loadShader(gl, simpleTextureFragmentShader, wgl.WebGL.FRAGMENT_SHADER);
}

/**
 * Creates a program, attaches shaders, binds attrib locations, links the
 * program and calls useProgram.
 * @param {!Array.<!WebGLShader>} shaders The shaders to attach .
 * @param {!Array.<string>} opt_attribs The attribs names.
 * @param {!Array.<number>} opt_locations The locations for the attribs.
 */
setupProgram(gl, shaders, [opt_attribs, opt_locations]) {
  var program = gl.createProgram();
  for (var ii = 0; ii < shaders.length; ++ii) {
    var shader = shaders[ii];
    if (shader is String) {
      var element = document.getElementById(shader);
      if (element != null) {
        shader = loadShaderFromScript(gl, shader);
      } else {
        shader = loadShader(gl, shader, ii>0 ? wgl.WebGL.FRAGMENT_SHADER : wgl.WebGL.VERTEX_SHADER);
      }
    }
    gl.attachShader(program, shader);
  }
  if (opt_attribs != null) {
    for (var ii = 0; ii < opt_attribs.length; ++ii) {
      gl.bindAttribLocation(
          program,
          opt_locations != null ? opt_locations[ii] : ii,
          opt_attribs[ii]);
    }
  }
  gl.linkProgram(program);

  // Check the link status
  var linked = gl.getProgramParameter(program, wgl.WebGL.LINK_STATUS);
  if (!linked) {
      // something went wrong with the link
      lastError = gl.getProgramInfoLog (program);
      error("Error in program linking:" + lastError);

      gl.deleteProgram(program);
      return null;
  }

  gl.useProgram(program);
  return program;
}

/**
 * Creates a simple texture program.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} opt_positionLocation The attrib location for position.
 * @param {number} opt_texcoordLocation The attrib location for texture coords.
 * @return {WebGLProgram}
 */
setupSimpleTextureProgram(gl, [opt_positionLocation=0, opt_texcoordLocation=1]) {
  var vs = setupSimpleTextureVertexShader(gl);
  var fs = setupSimpleTextureFragmentShader(gl);
  if (vs == null || fs == null) {
    return null;
  }
  var program = setupProgram(
      gl,
      [vs, fs],
      ['vPosition', 'texCoord0'],
      [opt_positionLocation, opt_texcoordLocation]);
  if (program == null) {
    gl.deleteShader(fs);
    gl.deleteShader(vs);
  }
  gl.useProgram(program);
  return program;
}

/**
 * Creates buffers for a textured unit quad and attaches them to vertex attribs.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} opt_positionLocation The attrib location for position.
 * @param {number} opt_texcoordLocation The attrib location for texture coords.
 * @return {!Array.<WebGLBuffer>} The buffer objects that were
 *      created.
 */
setupUnitQuad(gl, [opt_positionLocation=0, opt_texcoordLocation=1]) {
  var objects = [];

  var vertexObject = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([
       1.0,  1.0, 0.0,
      -1.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
       1.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
       1.0, -1.0, 0.0]), wgl.WebGL.STATIC_DRAW);
  gl.enableVertexAttribArray(opt_positionLocation);
  gl.vertexAttribPointer(opt_positionLocation, 3, wgl.WebGL.FLOAT, false, 0, 0);
  objects.add(vertexObject);

  vertexObject = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, new Float32List.fromList([
      1.0, 1.0,
      0.0, 1.0,
      0.0, 0.0,
      1.0, 1.0,
      0.0, 0.0,
      1.0, 0.0]), wgl.WebGL.STATIC_DRAW);
  gl.enableVertexAttribArray(opt_texcoordLocation);
  gl.vertexAttribPointer(opt_texcoordLocation, 2, wgl.WebGL.FLOAT, false, 0, 0);
  objects.add(vertexObject);
  return objects;
}

/**
 * Creates a program and buffers for rendering a textured quad.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} opt_positionLocation The attrib location for position.
 * @param {number} opt_texcoordLocation The attrib location for texture coords.
 * @return {!WebGLProgram}
 */
setupTexturedQuad(gl, [opt_positionLocation=0, opt_texcoordLocation=1]) {
  var program = setupSimpleTextureProgram(
      gl, opt_positionLocation, opt_texcoordLocation);
  setupUnitQuad(gl, opt_positionLocation, opt_texcoordLocation);
  return program;
}

/**
 * Creates a program and buffers for rendering a color quad.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} opt_positionLocation The attrib location for position.
 * @return {!WebGLProgram}
 */
setupColorQuad(gl, [opt_positionLocation=0]) {
  var program = setupProgram(
      gl,
      [simpleColorVertexShader, simpleColorFragmentShader],
      ['vPosition'],
      [opt_positionLocation]);
  setupUnitQuad(gl, opt_positionLocation);
  return program;
}

/**
 * Creates a unit quad with only positions of a given rez
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} gridRez The resolution of the mesh grid.
 * @param {number} opt_positionLocation The attrib location for position.
 */
setupQuad(gl, gridRes, [opt_positionLocation=0, opt_flipOddTriangles=false]) {
  var positionLocation = opt_positionLocation;
  var objects = [];

  var vertsAcross = gridRes + 1;
  var numVerts = vertsAcross * vertsAcross;
  var positions = new Float32List(numVerts * 3);
  var indices = new Uint16List(6 * gridRes * gridRes);

  var poffset = 0;

  for (var yy = 0; yy <= gridRes; ++yy) {
    for (var xx = 0; xx <= gridRes; ++xx) {
      positions[poffset + 0] = -1 + 2 * xx / gridRes;
      positions[poffset + 1] = -1 + 2 * yy / gridRes;
      positions[poffset + 2] = 0.0;

      poffset += 3;
    }
  }

  var tbase = 0;
  for (var yy = 0; yy < gridRes; ++yy) {
    var index = yy * vertsAcross;
    for (var xx = 0; xx < gridRes; ++xx) {
      indices[tbase + 0] = index + 0;
      indices[tbase + 1] = index + 1;
      indices[tbase + 2] = index + vertsAcross;
      indices[tbase + 3] = index + vertsAcross;
      indices[tbase + 4] = index + 1;
      indices[tbase + 5] = index + vertsAcross + 1;

      if (opt_flipOddTriangles) {
        indices[tbase + 4] = index + vertsAcross + 1;
        indices[tbase + 5] = index + 1;
      }

      index += 1;
      tbase += 6;
    }
  }

  var buf = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ARRAY_BUFFER, buf);
  gl.bufferData(wgl.WebGL.ARRAY_BUFFER, positions, wgl.WebGL.STATIC_DRAW);
  gl.enableVertexAttribArray(positionLocation);
  gl.vertexAttribPointer(positionLocation, 3, wgl.WebGL.FLOAT, false, 0, 0);
  objects.add(buf);

  buf = gl.createBuffer();
  gl.bindBuffer(wgl.WebGL.ELEMENT_ARRAY_BUFFER, buf);
  gl.bufferData(wgl.WebGL.ELEMENT_ARRAY_BUFFER, indices, wgl.WebGL.STATIC_DRAW);
  objects.add(buf);

  return objects;
}

/**
 * Fills the given texture with a solid color
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {!WebGLTexture} tex The texture to fill.
 * @param {number} width The width of the texture to create.
 * @param {number} height The height of the texture to create.
 * @param {!Array.<number>} color The color to fill with. A 4 element array
 *        where each element is in the range 0 to 255.
 * @param {number} opt_level The level of the texture to fill. Default = 0.
 */
fillTexture(gl, tex, width, height, color, [opt_level=0]) {
  var numPixels = width * height;
  var size = numPixels * 4;
  var buf = new Uint8List(size);
  for (var ii = 0; ii < numPixels; ++ii) {
    var off = ii * 4;
    buf[off + 0] = color[0];
    buf[off + 1] = color[1];
    buf[off + 2] = color[2];
    buf[off + 3] = color[3];
  }
  gl.bindTexture(wgl.WebGL.TEXTURE_2D, tex);
  gl.texImage2D(
      wgl.WebGL.TEXTURE_2D, opt_level, wgl.WebGL.RGBA, width, height, 0,
      wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
}

/**
 * Creates a textures and fills it with a solid color
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} width The width of the texture to create.
 * @param {number} height The height of the texture to create.
 * @param {!Array.<number>} color The color to fill with. A 4 element array
 *        where each element is in the range 0 to 255.
 * @return {!WebGLTexture}
 */
createColoredTexture(gl, width, height, color) {
  var tex = gl.createTexture();
  fillTexture(gl, tex, width, height, color);
  return tex;
}

ubyteToFloat(c) {
  return c / 255;
}

/**
 * Draws a previously setup quad in the given color.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {!Array.<number>} color The color to draw with. A 4
 *        element array where each element is in the range 0 to
 *        1.
 */
drawFloatColorQuad(gl, color) {

  if (color is! Float32List) {
    color = new Float32List.fromList(color as List<double>);
  }
  var program = gl.getParameter(wgl.WebGL.CURRENT_PROGRAM);
  var colorLocation = gl.getUniformLocation(program, "u_color");
  gl.uniform4fv(colorLocation, color);
  gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);
}

/**
 * Draws a previously setup quad in the given color.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {!Array.<number>} color The color to draw with. A 4
 *        element array where each element is in the range 0 to
 *        255.
 */
drawUByteColorQuad(gl, color) {
  var floatColor = [];
  for (var ii = 0; ii < color.length; ++ii) {
    floatColor.add(ubyteToFloat(color[ii]));
  }
  drawFloatColorQuad(gl, floatColor);
}

/**
 * Draws a previously setup quad.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {!Array.<number>} opt_color The color to fill clear with before
 *        drawing. A 4 element array where each element is in the range 0 to
 *        255. Default [255, 255, 255, 255]
 */
drawQuad(gl, [opt_color=const [255, 255, 255, 255]]) {
  gl.clearColor(
      opt_color[0] / 255,
      opt_color[1] / 255,
      opt_color[2] / 255,
      opt_color[3] / 255);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
  gl.drawArrays(wgl.WebGL.TRIANGLES, 0, 6);
}

/**
 * Draws a previously setup quad.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} gridRes Resolution of grid.
 * @param {!Array.<number>} opt_color The color to fill clear with before
 *        drawing. A 4 element array where each element is in the range 0 to
 *        255. Default [255, 255, 255, 255]
 */
drawIndexedQuad(gl, gridRes, [opt_color=const [255, 255, 255, 255]]) {
  gl.clearColor(
      opt_color[0] / 255,
      opt_color[1] / 255,
      opt_color[2] / 255,
      opt_color[3] / 255);
  gl.clear(wgl.WebGL.COLOR_BUFFER_BIT | wgl.WebGL.DEPTH_BUFFER_BIT);
  gl.drawElements(wgl.WebGL.TRIANGLES, gridRes * 6, wgl.WebGL.UNSIGNED_SHORT, 0);
}

/**
 * Checks that a portion of a canvas is 1 color.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} x left corner of region to check.
 * @param {number} y bottom corner of region to check.
 * @param {number} width width of region to check.
 * @param {number} height width of region to check.
 * @param {!Array.<number>} color The color to fill clear with before drawing. A
 *        4 element array where each element is in the range 0 to 255.
 * @param {string} msg Message to associate with success. Eg ("should be red").
 * @param {number} errorRange Optional. Acceptable error in
 *        color checking. 0 by default.
 */
checkCanvasRect(gl, x, y, width, height, color, msg, [errorRange=0]) {
  var buf = new Uint8List(width * height * 4);
  gl.readPixels(x, y, width, height, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, buf);
  for (var i = 0; i < width * height; ++i) {
    var offset = i * 4;
    for (var j = 0; j < color.length; ++j) {
      if ((buf[offset + j] - color[j]).abs() > errorRange) {
        var was = buf[offset + 0].toString();
        for (j = 1; j < color.length; ++j) {
          was += "," + buf[offset + j].toString();
        }
        var where = ': at (' + (i % width).toString() + ', ' + 
            (i / width).floor().toString() +
            ') expected: ' + color.toString() + ' was ' + was;
        testFailed(msg+where);
        return;
      }
    }
  }
  testPassed(msg);
}

/**
 * Checks that an entire canvas is 1 color.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {!Array.<number>} color The color to fill clear with before drawing. A
 *        4 element array where each element is in the range 0 to 255.
 * @param {string} msg Message to associate with success. Eg ("should be red").
 * @param {number} errorRange Optional. Acceptable error in
 *        color checking. 0 by default.
 */
checkCanvas(gl, color, msg, [errorRange=0]) {
  checkCanvasRect(gl, 0, 0, gl.canvas.width, gl.canvas.height, color, msg, errorRange);
}

/**
 * Loads a texture, calls callback when finished.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {string} url URL of image to load
 * @param {function(!Image): void} callback Function that gets called after
 *        image has loaded
 * @return {!WebGLTexture} The created texture.
 */
loadTexture(gl, url, callback) {
    var texture = gl.createTexture();
    gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MIN_FILTER, wgl.WebGL.NEAREST);
    gl.texParameteri(wgl.WebGL.TEXTURE_2D, wgl.WebGL.TEXTURE_MAG_FILTER, wgl.WebGL.NEAREST);
    var image = new ImageElement();
    image.onLoad.listen((_) {
        gl.bindTexture(wgl.WebGL.TEXTURE_2D, texture);
        gl.pixelStorei(wgl.WebGL.UNPACK_FLIP_Y_WEBGL, 1);
        gl.texImage2DImage(wgl.WebGL.TEXTURE_2D, 0, wgl.WebGL.RGBA, wgl.WebGL.RGBA, wgl.WebGL.UNSIGNED_BYTE, image);
        callback(image);
    });
    image.src = url;
    return texture;
}

/**
 * Creates a webgl context.
 * @param {!Canvas} opt_canvas The canvas tag to get context from. If one is not
 *     passed in one will be created.
 * @return {!WebGLContext} The created context.
 */
create3DContext([opt_canvas, opt_attributes]) {
  opt_canvas = opt_canvas != null ? opt_canvas :
    document.createElement("canvas");
  if (opt_canvas is String) {
    opt_canvas = document.getElementById(opt_canvas);
  }
  var context = null;
  var names = ["webgl", "experimental-webgl"];
  for (var i = 0; i < names.length; ++i) {
    try {
      if (opt_attributes == null)
        context = opt_canvas.getContext(names[i]);
      else
        context = opt_canvas.getContext(names[i], opt_attributes);
    } catch (e) {
    }
    if (context != null) {
      break;
    }
  }
  if (context == null) {
    testFailed("Unable to fetch WebGL rendering context for Canvas");
  }
  return context;
}
/**
 * Gets a GLError value as a string.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} err The webgl error as retrieved from gl.getError().
 * @return {string} the error as a string.
 */
getGLErrorAsString(gl, err) {
  if (err == wgl.WebGL.NO_ERROR) {
    return "NO_ERROR";
  }
  //TODO
  /*for (var name in gl) {
    if (gl[name] === err) {
      return name;
    }
  }*/
  return err.toString();
}

//TODO skipped createGLErrorWrapper, create3DContextWithWrapperThatThrowsOnGLError

readFile(file) {
  var xhr = new HttpRequest();
  xhr.open("GET", file, async:false);
  xhr.send();
  return xhr.responseText.replaceAll(new RegExp(r'\r'), "");
}

readFileList(url) {
  var files = [];
  if (url.substring(url.length - 4) == '.txt') {
    var lines = readFile(url).split(new RegExp(r'\n'));
    var prefix = '';
    var lastSlash = url.lastIndexOf('/');
    if (lastSlash >= 0) {
      prefix = url.substring(0, lastSlash + 1);
    }
    for (var ii = 0; ii < lines.length; ++ii) {
      var str = lines[ii].replaceFirst(new RegExp(r'^\s\s*'), '')
                         .replaceFirst(new RegExp(r'\s\s*$'), '');
      if (str.length > 4 &&
          str[0] != '#' &&
          str[0] != ";" &&
          str.substring(0, 2) != "//") {
        var names = str.split(new RegExp(' +'));
        if (names.length == 1) {
          var new_url = prefix + str;
          files.addAll(readFileList(new_url));
        } else {
          var s = "";
          var p = "";
          for (var jj = 0; jj < names.length; ++jj) {
            s += p + prefix + names[jj];
            p = " ";
          }
          files.add(s);
        }
      }
    }
  } else {
    files.add(url);
  }
  return files;
}

/**
 * Tests that an evaluated expression generates a specific GL error.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} glError The expected gl error.
 * @param {function} func Function to evaluate.
 */
shouldGenerateGLError(gl, glError, func) {
  var exception;
  try {
    func();
  } catch (e) {
    exception = e;
  }
  if (exception != null) {
    testFailed("Threw unexpected exception: $exception");
  } else {
    var err = gl.getError();
    if (err != glError) {
      testFailed("Expected: " + getGLErrorAsString(gl, glError) + ". Was " + getGLErrorAsString(gl, err) + ".");
    } else {
      testPassed("Was expected value: " + getGLErrorAsString(gl, glError) + ".");
    }
  }
}

/**
 * Tests that the first error GL returns is the specified error.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number} glError The expected gl error.
 * @param {string} opt_msg
 */
glErrorShouldBe(gl, glError, [opt_msg=""]) {
  var err = gl.getError();
  if (err != glError) {
    testFailed("getError expected: " + getGLErrorAsString(gl, glError) +
               ". Was " + getGLErrorAsString(gl, err) + " : " + opt_msg);
  } else {
    testPassed("getError was expected value: " +
                getGLErrorAsString(gl, glError) + " : " + opt_msg);
  }
}

/**
 * Links a WebGL program, throws if there are errors.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {!WebGLProgram} program The WebGLProgram to link.
 * @param {function(string): void) opt_errorCallback callback for errors. 
 */
linkProgram(gl, program, [opt_errorCallback]) {
  // Link the program
  gl.linkProgram(program);

  // Check the link status
  var linked = gl.getProgramParameter(program, wgl.WebGL.LINK_STATUS);
  if (!linked) {
    // something went wrong with the link
    var error = gl.getProgramInfoLog (program);

    testFailed("Error in program linking:" + error);

    gl.deleteProgram(program);
  }
}

/**
 * Loads a shader.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {string} shaderSource The shader source.
 * @param {number} shaderType The type of shader. 
 * @param {function(string): void) opt_errorCallback callback for errors. 
 * @return {!WebGLShader} The created shader.
 */
loadShader(gl, shaderSource, shaderType, [opt_errorCallback]) {
  var errFn = opt_errorCallback != null ? opt_errorCallback : error;
  // Create the shader object
  var shader = gl.createShader(shaderType);
  if (shader == null) {
    errFn("*** Error: unable to create shader '"+shaderSource+"'");
    return null;
  }

  // Load the shader source
  gl.shaderSource(shader, shaderSource);
  var err = gl.getError();
  if (err != wgl.WebGL.NO_ERROR) {
    errFn("*** Error loading shader '" + shader.toString() + "':" +
        glEnumToString(gl, err));
    return null;
  }

  // Compile the shader
  gl.compileShader(shader);

  // Check the compile status
  var compiled = gl.getShaderParameter(shader, wgl.WebGL.COMPILE_STATUS);
  if (!compiled) {
    // Something went wrong during compilation; get the error
    lastError = gl.getShaderInfoLog(shader);
    errFn("*** Error compiling shader '" + shader.toString() + "':" +
        lastError);
    gl.deleteShader(shader);
    return null;
  }

  return shader;
}

/**
 * Loads a shader from a URL.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {file} file The URL of the shader source.
 * @param {number} type The type of shader.
 * @param {function(string): void) opt_errorCallback callback for errors. 
 * @return {!WebGLShader} The created shader.
 */
loadShaderFromFile(gl, file, type, [opt_errorCallback]) {
  var shaderSource = readFile(file);
  return loadShader(gl, shaderSource, type, opt_errorCallback);
}

/**
 * Loads a shader from a script tag.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {string} scriptId The id of the script tag.
 * @param {number} opt_shaderType The type of shader. If not passed in it will
 *     be derived from the type of the script tag.
 * @param {function(string): void) opt_errorCallback callback for errors. 
 * @return {!WebGLShader} The created shader.
 */
loadShaderFromScript(gl, scriptId, [opt_shaderType, opt_errorCallback]) {
  var shaderSource = "";
  var shaderType;
  dynamic shaderScript = document.getElementById(scriptId);
  if (shaderScript == null) {
    throw("*** Error: unknown script element" + scriptId);
  }
  shaderSource = shaderScript.text;

  if (opt_shaderType == null) {
    if (shaderScript.type == "x-shader/x-vertex") {
      shaderType = wgl.WebGL.VERTEX_SHADER;
    } else if (shaderScript.type == "x-shader/x-fragment") {
      shaderType = wgl.WebGL.FRAGMENT_SHADER;
    } else if (shaderType != gl.VERTEX_SHADER && shaderType != gl.FRAGMENT_SHADER) {
      throw("*** Error: unknown shader type");
    }
  }

  return loadShader(
      gl, shaderSource, opt_shaderType != null ? opt_shaderType : shaderType,
      opt_errorCallback);
}

loadStandardProgram(gl) {
  var program = gl.createProgram();
  gl.attachShader(program, loadStandardVertexShader(gl));
  gl.attachShader(program, loadStandardFragmentShader(gl));
  linkProgram(gl, program);
  return program;
}

/**
 * Loads shaders from files, creates a program, attaches the shaders and links.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {string} vertexShaderPath The URL of the vertex shader.
 * @param {string} fragmentShaderPath The URL of the fragment shader.
 * @param {function(string): void) opt_errorCallback callback for errors. 
 * @return {!WebGLProgram} The created program.
 */
loadProgramFromFile(gl, vertexShaderPath, fragmentShaderPath, [opt_errorCallback]) {
  var program = gl.createProgram();
  gl.attachShader(
      program,
      loadShaderFromFile(
        gl, vertexShaderPath, wgl.WebGL.VERTEX_SHADER, opt_errorCallback));
  gl.attachShader(
      program,
      loadShaderFromFile(
        gl, fragmentShaderPath, wgl.WebGL.FRAGMENT_SHADER, opt_errorCallback));
  linkProgram(gl, program, opt_errorCallback);
  return program;
}

/**
 * Loads shaders from script tags, creates a program, attaches the shaders and
 * links.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {string} vertexScriptId The id of the script tag that contains the
 *        vertex shader.
 * @param {string} fragmentScriptId The id of the script tag that contains the
 *        fragment shader.
 * @param {function(string): void) opt_errorCallback callback for errors. 
 * @return {!WebGLProgram} The created program.
 */
loadProgramFromScript(
    gl, vertexScriptId, fragmentScriptId, [opt_errorCallback]) {
  var program = gl.createProgram();
  gl.attachShader(
      program,
      loadShaderFromScript(
        gl, vertexScriptId, wgl.WebGL.VERTEX_SHADER, opt_errorCallback));
  gl.attachShader(
      program,
      loadShaderFromScript(
        gl, fragmentScriptId,  wgl.WebGL.FRAGMENT_SHADER, opt_errorCallback));
  linkProgram(gl, program, opt_errorCallback);
  return program;
}

loadStandardVertexShader(gl) {
  return loadShaderFromFile(
      gl, getBasePath() + "vertexShader.vert", wgl.WebGL.VERTEX_SHADER);
}

loadStandardFragmentShader(gl) {
  return loadShaderFromFile(
      gl, getBasePath() + "fragmentShader.frag", wgl.WebGL.FRAGMENT_SHADER);
}

/**
 * Loads an image asynchronously.
 * @param {string} url URL of image to load.
 * @param {!function(!Element): void} callback Function to call
 *     with loaded image.
 */
loadImageAsync(url, callback) {
  dynamic img = document.createElement('img');
  img.onLoad.listen((_) {
    callback(img);
  });
  img.src = url;
}

/**
 * Loads an array of images.
 * @param {!Array.<string>} urls URLs of images to load.
 * @param {!function(!{string, img}): void} callback. Callback
 *     that gets passed map of urls to img tags.
 */
loadImagesAsync(urls, callback) {
  var count = 0;
  var images = { };
  countDown() {
    --count;
    if (count == 0) {
      callback(images);
    }
  }
  imageLoaded(url) {
    return (img) {
      images[url] = img;
      countDown();
    };
  }
  for (var ii = 0; ii < urls.length; ++ii) {
    ++count;
    loadImageAsync(urls[ii], imageLoaded(urls[ii]));
  }
}

// Add your prefix here.
var browserPrefixes = [
  "",
  "MOZ_",
  "OP_",
  "WEBKIT_"
];

/**
 * Given an extension name like WEBGL_compressed_texture_s3tc
 * returns the name of the supported version extension, like
 * WEBKIT_WEBGL_compressed_teture_s3tc
 * @param {string} name Name of extension to look for
 * @return {string} name of extension found or undefined if not
 *     found.
 */
getSupportedExtensionWithKnownPrefixes(gl, name) {
  var supported = gl.getSupportedExtensions();
  for (var ii = 0; ii < browserPrefixes.length; ++ii) {
    var prefixedName = browserPrefixes[ii] + name;
    if (supported.indexOf(prefixedName) >= 0) {
      return prefixedName;
    }
  }
  return null;
}

/**
 * Given an extension name like WEBGL_compressed_texture_s3tc
 * returns the supported version extension, like
 * WEBKIT_WEBGL_compressed_teture_s3tc
 * @param {string} name Name of extension to look for
 * @return {WebGLExtension} The extension or undefined if not
 *     found.
 */
getExtensionWithKnownPrefixes(gl, name) {
  for (var ii = 0; ii < browserPrefixes.length; ++ii) {
    var prefixedName = browserPrefixes[ii] + name;
    var ext = gl.getExtension(prefixedName);
    if (ext != null) {
      return ext;
    }
  }
  return null;
}

var requestAnimFrame = window.requestAnimationFrame;

var cancelAnimFrame = window.cancelAnimationFrame;

waitFrames(frames, callback) {
  FrameRequestCallback countDown;
  countDown = (_) {
    if (frames == 0) {
      callback();
    } else {
      --frames;
      requestAnimFrame(countDown);
    }
  };
  countDown(null);
}
