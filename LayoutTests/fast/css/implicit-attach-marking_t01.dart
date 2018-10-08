/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
<div id="root"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.requestAnimationFrame((_) {
    dynamic div = document.getElementById('root').append(document.createElement("div"));
    div.text = "Test that implicit attach marks all ancestors on insert.";
    shouldBeTrue(div.offsetTop > 0);
    asyncEnd();
  });
}
