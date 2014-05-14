/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test ensures that the shadow element is available.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div>
      <shadow id="shadow"></shadow>
    </div>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var shadow = document.getElementById("shadow");
  shouldBe(shadow.nodeName, 'SHADOW');
  shouldBeTrue(shadow is ShadowElement);
}
