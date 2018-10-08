/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library webgl_test;

import 'dart:html';
import 'dart:web_gl' as wgl;
import "../../../../testcommon.dart";
import "pwd.dart";

assertMsg(assertion, msg) {
  if (assertion) {
    testPassed(msg);
  } else {
    testFailed(msg);
  }
}

webglTestLog(msg) {
  print(msg);

  var log = document.getElementById("console");
  if (log != null) {
    log.innerHtml += msg + "<br>";
  }
}

//
// create3DContext
//
// Returns the WebGLRenderingContext for any known implementation.
//
create3DContext([canvas, attributes]) {
  if (canvas == null)
    canvas = document.createElement("canvas");
  var context = null;

  tryContext(canvas, id, attributes) {
    var ctx;
    try {
      if (attributes == null)
        ctx = canvas.getContext(id);
      else
        ctx = canvas.getContext(id, attributes);
    } catch(_) {}
    return ctx;
  }

  if (context == null)
    context = tryContext(canvas, "webgl", attributes);
  if (context == null)
    context = tryContext(canvas, "webgl2", attributes);
  if (context == null)
    context = tryContext(canvas, "experimental-webgl", attributes);
  if (context == null)
    context = tryContext(canvas, "webkit-3d", attributes);
  if (context == null)
    context = tryContext(canvas, "moz-webgl", attributes);
  if (context == null)
    throw "Unable to fetch WebGL rendering context for Canvas";

  return context;
}

getGLErrorAsString(ctx, err) {
  if (err == wgl.WebGL.NO_ERROR) {
    return "NO_ERROR";
  }
  /*for (var name in ctx) {
    if (ctx[name] === err) {
      return name;
    }
  }*/
  return "0x" + err.toRadixString(16);
}

// Pass undefined for glError to test that it at least throws some error
shouldGenerateGLError(ctx, glErrors, func) {
  if (glErrors is num) {
    glErrors = [glErrors];
  }
  var exception;
  try {
    func();
  } catch (e) {
    exception = e;
  }
  if (exception != null) {
    testFailed("shouldGenerateGLError: Threw unexpected exception: $exception");
  } else {
    var err = ctx.getError();
    var errStrs = [];
    for (var ii = 0; ii < glErrors.length; ++ii) {
      errStrs.add(getGLErrorAsString(ctx, glErrors[ii]));
    }
    var expected = errStrs.join(" or ");
    if (glErrors.indexOf(err) < 0) {
      testFailed("shouldGenerateGLError: Expected: " + expected + ". Was " + getGLErrorAsString(ctx, err) + ".");
    } else {
      var msg = (glErrors.length == 1) ? "shouldGenerateGLError: Generated expected GL error: " :
                                         "shouldGenerateGLError: Generated one of expected GL errors: ";
      testPassed(msg + expected + ".");
    }
  }
}

/**
 * Tests that the first error GL returns is the specified error.
 * @param {!WebGLContext} gl The WebGLContext to use.
 * @param {number|!Array.<number>} glError The expected gl
 *        error. Multiple errors can be passed in using an
 *        array.
 * @param {string} opt_msg Optional additional message.
 */
glErrorShouldBe(gl, glErrors, [opt_msg=""]) {
  if (glErrors is num) {
    glErrors = [glErrors];
  }
  var err = gl.getError();
  var ndx = glErrors.indexOf(err);
  var errStrs = [];
  for (var ii = 0; ii < glErrors.length; ++ii) {
    errStrs.add(getGLErrorAsString(gl, glErrors[ii]));
  }
  var expected = errStrs.join(" or ");
  if (ndx < 0) {
    var msg = "getError expected" + ((glErrors.length > 1) ? " one of: " : ": ");
    testFailed(msg + expected +  ". Was " + getGLErrorAsString(gl, err) + " : " + opt_msg);
  } else {
    var msg = "getError was " + ((glErrors.length > 1) ? "one of: " : "expected value: ");
    testPassed(msg + expected + " : " + opt_msg);
  }
}

//
// createProgram
//
// Create and return a program object, attaching each of the given shaders.
//
// If attribs are given, bind an attrib with that name at that index.
//
createProgram(gl, vshaders, fshaders, [attribs])
{
  if (vshaders is String)
    vshaders = [vshaders];
  if (fshaders is String)
    fshaders = [fshaders];

  var shaders = [];
  var i;

  for (i = 0; i < vshaders.length; ++i) {
    var shader = loadShader(gl, vshaders[i], wgl.WebGL.VERTEX_SHADER);
    if (shader == null)
      return null;
    shaders.add(shader);
  }

  for (i = 0; i < fshaders.length; ++i) {
    var shader = loadShader(gl, fshaders[i], wgl.WebGL.FRAGMENT_SHADER);
    if (shader == null)
      return null;
    shaders.add(shader);
  }

  var prog = gl.createProgram();
  for (i = 0; i < shaders.length; ++i) {
    gl.attachShader(prog, shaders[i]);
  }

  if (attribs != null) {
    for (var i=0; i<attribs.length; ++i) {
      gl.bindAttribLocation (prog, i, attribs[i]);
    }
  }

  gl.linkProgram(prog);

  // Check the link status
  var linked = gl.getProgramParameter(prog, wgl.WebGL.LINK_STATUS);
  if (!linked) {
    // something went wrong with the link
    var error = gl.getProgramInfoLog(prog);
    webglTestLog("Error in program linking:" + error);

    gl.deleteProgram(prog);
    for (i = 0; i < shaders.length; ++i)
      gl.deleteShader(shaders[i]);
    return null;
  }

  return prog;
}

//
// initWebGL
//
// Initialize the Canvas element with the passed name as a WebGL object and
// return the WebGLRenderingContext.
//
// Load shaders with the passed names and create a program with them. Return
// this program in the 'program' property of the returned context.
//
// [for dart just return a context and program is accessible by
//  gl.getParameter(wgl.WebGL.CURRENT_PROGRAM)]
//
// For each string in the passed attribs array, bind an attrib with that name
// at that index.  Once the attribs are bound, link the program and then use
// it.
//
// Set the clear color to the passed array (4 values) and set the clear depth
// to the passed value.  Enable depth testing and blending with a blend func of
// (SRC_ALPHA, ONE_MINUS_SRC_ALPHA)
//
initWebGL(canvasName, vshader, fshader, attribs, clearColor, clearDepth, [contextAttribs])
{
  var canvas = document.getElementById(canvasName);
  var gl = create3DContext(canvas, contextAttribs);
  if (gl == null) {
    testFailed("No WebGL context found");
    return null;
  }

  // Create the program object
  var program = createProgram(gl, vshader, fshader, attribs);
  if (program == null)
    return null;

  gl.useProgram(program);

  gl.clearColor(clearColor[0], clearColor[1], clearColor[2], clearColor[3]);
  gl.clearDepth(clearDepth);

  gl.enable(wgl.WebGL.DEPTH_TEST);
  gl.enable(wgl.WebGL.BLEND);
  gl.blendFunc(wgl.WebGL.SRC_ALPHA, wgl.WebGL.ONE_MINUS_SRC_ALPHA);

  return gl;
}

//
// getShaderSource
//
// Load the source from the passed shader file.
//
getShaderSource(file)
{
  var xhr = new HttpRequest();
  xhr.open("GET", file, async:false);
  xhr.send();
  return xhr.responseText;
}

//
// loadShader
//
// 'shader' is either the id of a <script> element containing the shader source
// string, the shader string itself,  or the URL of a file containing the shader
// source. Load this shader and return the WebGLShader object corresponding to
// it.
//
loadShader(ctx, shaderId, shaderType, [isFile=false])
{
  var shaderSource = "";

  if (isFile)
    shaderSource = getShaderSource(shaderId);
  else {
    dynamic shaderScript = document.getElementById(shaderId);
    if (shaderScript == null) {
      shaderSource = shaderId;
    } else {
      if (shaderScript.type == "x-shader/x-vertex") {
        shaderType = wgl.WebGL.VERTEX_SHADER;
      } else if (shaderScript.type == "x-shader/x-fragment") {
        shaderType = wgl.WebGL.FRAGMENT_SHADER;
      } else if (shaderType != wgl.WebGL.VERTEX_SHADER && shaderType != wgl.WebGL.FRAGMENT_SHADER) {
        webglTestLog("*** Error: unknown shader type");
        return null;
      }

      shaderSource = shaderScript.text;
    }
  }

  // Create the shader object
  var shader = ctx.createShader(shaderType);
  if (shader == null) {
    webglTestLog("*** Error: unable to create shader '"+shaderId+"'");
    return null;
  }

  // Load the shader source
  ctx.shaderSource(shader, shaderSource);

  // Compile the shader
  ctx.compileShader(shader);

  // Check the compile status
  var compiled = ctx.getShaderParameter(shader, wgl.WebGL.COMPILE_STATUS);
  if (!compiled) {
    // Something went wrong during compilation; get the error
    var error = ctx.getShaderInfoLog(shader);
    webglTestLog("*** Error compiling shader: $error, shaderSource: $shaderSource");
    ctx.deleteShader(shader);
    return null;
  }

  return shader;
}

loadShaderFromFile(ctx, file, type)
{
  return loadShader(ctx, file, type, true);
}

loadShaderFromScript(ctx, script)
{
  return loadShader(ctx, script, 0, false);
}

loadStandardProgram(context) {
  var program = context.createProgram();
  context.attachShader(program, loadStandardVertexShader(context));
  context.attachShader(program, loadStandardFragmentShader(context));
  context.linkProgram(program);
  return program;
}

loadProgram(context, vertexShaderPath, fragmentShaderPath, [isFile=true]) {
  var program = context.createProgram();
  context.attachShader(program, loadShader(context, vertexShaderPath, wgl.WebGL.VERTEX_SHADER, isFile));
  context.attachShader(program, loadShader(context, fragmentShaderPath, wgl.WebGL.FRAGMENT_SHADER, isFile));
  context.linkProgram(program);
  return program;
}

loadStandardVertexShader(context) {
  return loadShader(context, "$root/vertexShader.vert", wgl.WebGL.VERTEX_SHADER, true);
}

loadStandardFragmentShader(context) {
  return loadShader(context, "$root/fragmentShader.frag", wgl.WebGL.FRAGMENT_SHADER, true);
}
