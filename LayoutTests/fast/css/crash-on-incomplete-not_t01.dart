/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description PASS without crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style id="m"></style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  var g = ":not\\( .title{}";
  var me = document.getElementById("m");

  runTest() {
    me.text = g;
    asyncEnd();
  }

  asyncStart();
  setTimeout(runTest, 0);
}
