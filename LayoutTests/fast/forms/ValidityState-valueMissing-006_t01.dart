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
      <p>There are two checkboxes below, both are required, only one is checked.</p>
      <input name="victim" type="checkbox" required checked/>
      <input name="victim" type="checkbox" required />
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");

  shouldBeFalse(v[0].validity.valueMissing);
  shouldBeTrue(v[1].validity.valueMissing);
}
