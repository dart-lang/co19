/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests that we do not crash when RenderCounter traverses
 * detached render trees.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setAttribute("style", "counter-increment: ctr");

  document.body.setInnerHtml('''
      <object>
          <b style="counter-increment: ctr"><div></div></b>
          <menu style="counter-increment: ctr"></menu>
      </object>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(_) {
    document.body.querySelector("div").innerHtml = "PASS";
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(test);
}
