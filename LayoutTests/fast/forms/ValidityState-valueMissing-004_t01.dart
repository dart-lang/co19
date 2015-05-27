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
      <p>There are two readonly form control elements below, both required and with some value:
      validity.valueMissing should be false in both cases.</p>
      <input name="victim" readonly required />
      <textarea name="victim" readonly required></textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  var v = document.getElementsByName("victim");

  shouldBeFalse(v[0].validity.valueMissing);
  shouldBeFalse(v[1].validity.valueMissing);
}
