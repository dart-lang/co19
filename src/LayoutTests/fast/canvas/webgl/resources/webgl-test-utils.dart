/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
// Copyright (c) 2011 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html';
import 'dart:web_gl' as wgl;
import 'dart:typed_data';
import "../../../../testcommon.dart";

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
  }
  return "0x" + value.toString(16);*/

  return value.toString();
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
    return loadShader(gl, simpleTextureVertexShader, wgl.VERTEX_SHADER);
}

/**
 * Creates a simple texture fragment shader.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @return {!WebGLShader}
 */
setupSimpleTextureFragmentShader(gl) {
    return loadShader(gl, simpleTextureFragmentShader, wgl.FRAGMENT_SHADER);
}

//TODO
loadShaderFromScript(_,__) {}

/**
 * Creates a program, attaches shaders, binds attrib locations, links the
 * program and calls useProgram.
 * @param {!Array.<!WebGLShader>} shaders The shaders to attach .
 * @param {!Array.<string>} opt_attribs The attribs names.
 * @param {!Array.<number>} opt_locations The locations for the attribs.
 */
setupProgram(gl, shaders, [opt_attribs, opt_locations]) {
  var realShaders = [];
  var program = gl.createProgram();
  for (var ii = 0; ii < shaders.length; ++ii) {
    var shader = shaders[ii];
    if (shader is String) {
      var element = document.getElementById(shader);
      if (element != null) {
        shader = loadShaderFromScript(gl, shader);
      } else {
        shader = loadShader(gl, shader, ii>0 ? wgl.FRAGMENT_SHADER : wgl.VERTEX_SHADER);
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
  var linked = gl.getProgramParameter(program, wgl.LINK_STATUS);
  if (linked == null) {
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
  gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.ARRAY_BUFFER, new Float32List.fromList([
       1.0,  1.0, 0.0,
      -1.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
       1.0,  1.0, 0.0,
      -1.0, -1.0, 0.0,
       1.0, -1.0, 0.0]), wgl.STATIC_DRAW);
  gl.enableVertexAttribArray(opt_positionLocation);
  gl.vertexAttribPointer(opt_positionLocation, 3, wgl.FLOAT, false, 0, 0);
  objects.add(vertexObject);

  vertexObject = gl.createBuffer();
  gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
  gl.bufferData(wgl.ARRAY_BUFFER, new Float32List.fromList([
      1.0, 1.0,
      0.0, 1.0,
      0.0, 0.0,
      1.0, 1.0,
      0.0, 0.0,
      1.0, 0.0]), wgl.STATIC_DRAW);
  gl.enableVertexAttribArray(opt_texcoordLocation);
  gl.vertexAttribPointer(opt_texcoordLocation, 2, wgl.FLOAT, false, 0, 0);
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
  gl.bindTexture(wgl.TEXTURE_2D, tex);
  gl.texImage2D(
      wgl.TEXTURE_2D, opt_level, wgl.RGBA, width, height, 0,
      wgl.RGBA, wgl.UNSIGNED_BYTE, buf);
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
  gl.clear(wgl.COLOR_BUFFER_BIT | wgl.DEPTH_BUFFER_BIT);
  gl.drawArrays(wgl.TRIANGLES, 0, 6);
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
  gl.readPixels(x, y, width, height, wgl.RGBA, wgl.UNSIGNED_BYTE, buf);
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
  if (err != wgl.NO_ERROR) {
    errFn("*** Error loading shader '" + shader.toString() + "':" +
        glEnumToString(gl, err));
    return null;
  }

  // Compile the shader
  gl.compileShader(shader);

  // Check the compile status
  var compiled = gl.getShaderParameter(shader, wgl.COMPILE_STATUS);
  if (compiled == null) {
    // Something went wrong during compilation; get the error
    lastError = gl.getShaderInfoLog(shader);
    errFn("*** Error compiling shader '" + shader.toString() + "':" +
        lastError);
    gl.deleteShader(shader);
    return null;
  }

  return shader;
}
