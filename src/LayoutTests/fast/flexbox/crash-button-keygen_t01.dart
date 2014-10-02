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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <p style="visibility: collapse;"><button><keygen autofocus><input id="test"></keygen></button></p>
      <p>Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=63776">63776</a>: Partial layout when a flex-box has visibility: collapse</p>
      <p>This test PASSES if it does not CRASH.</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.body.offsetTop;
  document.getElementById('test').remove();
  document.body.offsetTop;
}
