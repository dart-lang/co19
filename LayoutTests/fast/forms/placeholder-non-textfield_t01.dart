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
      <p>
          Test for <i><a href="rdar://problem/6469944">rdar://problem/6469944</a> REGRESSION(3.2.1-ToT): Repro crash in WebCore::HTMLInputElement::updatePlaceholderVisibility opening http://billshrink.com</i>.
      </p>
      <p>
          Not crashing means PASS.
      </p>
      <input id="target" type="button" value="PASS">
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  document.getElementById("target").setAttribute("placeholder", "placeholder");
}
