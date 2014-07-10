/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that the CSS parser does not accept caps-lock-indicator as
 * a -webkit-appearance value.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="target" style="display: none; -webkit-appearance: caps-lock-indicator;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var appearance = document.getElementById("target").style
    .getPropertyValue('webkitAppearance');

  shouldBe(appearance, '');
}
