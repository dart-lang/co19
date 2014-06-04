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
      <div style="position:relative; display:inline; border:1px solid black">Div
          <a id="anchor" style="border:1px solid red">Anchor</a>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var anchor = document.getElementById("anchor");
  shouldBeNonNull(anchor.offsetParent); // div
}
