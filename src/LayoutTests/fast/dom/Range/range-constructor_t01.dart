/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that we can create instances of Range using new
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="test-div">Test</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  shouldBeTrue(new Range() is Range);

  var r = new Range();
  r.selectNodeContents(document.getElementById('test-div'));
  shouldBe(r.toString(), "Test");
}
