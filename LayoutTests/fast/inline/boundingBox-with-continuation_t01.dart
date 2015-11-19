/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<div id="container" style="width:400px">
  <span id="test">
    <img style="width: 50px; height: 50px" src="about:blank">
      <div style="width: 75px; height: 200px "></div>
      <img style="width: 50px; height: 50px" src="about:blank">
  </span>
</div>
<div id="console">FAIL: Test did not run.</div>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var elem = document.getElementById('test');
    window.
    var rect = internals.boundingBox(elem);
    Expect.equals(400, rect.width);
}
