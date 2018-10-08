/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";
import "resources/webgl-test.dart";

main() {
  var extension;

  finishTest() {
    extension.loseContext();
    document.body.innerHtml = "PASS";
    asyncEnd();
  }

  dynamic canvas = document.createElement("canvas");
  var context = create3DContext(canvas);
  extension = context.getExtension("WEBGL_lose_context");

  canvas = null;
  context = null;
  gc();

  asyncStart();
  setTimeout(finishTest, 1);
}
