/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

import 'dart:html';
import 'dart:web_gl' as wgl;
import "../../../../testcommon.dart";

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
    context = tryContext(canvas, "experimental-webgl", attributes);
  if (context == null)
    context = tryContext(canvas, "webkit-3d", attributes);
  if (context == null)
    context = tryContext(canvas, "moz-webgl", attributes);
  if (context == null)
    throw "Unable to fetch WebGL rendering context for Canvas";

  return context;
}
