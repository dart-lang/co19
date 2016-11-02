/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the HTMLSelectElement.item() argument is correctly
 * validated.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <select id="target">
      <option value="a">a</option>
      <option value="b">b</option>
      <option value="c">c</option>
      <option value="d">d</option>
    </select>
    ''', treeSanitizer: new NullTreeSanitizer());

  dynamic select = document.getElementById('target');
  shouldBeTrue(select is SelectElement);

  shouldBeEqualToString(select.item(0).value, "a");
  shouldBeEqualToString(select.item(1).value, "b");
  shouldBeEqualToString(select.item(2).value, "c");
  shouldBeEqualToString(select.item(3).value, "d");

  shouldBeNull(select.item(4));
  //shouldBeNull(select.item(-1)); // Offset is too large (after wrapping) NA to dart
  //shouldBeEqualToString(select.item(-4294967294).value, "c"); // Wraps to 2, which is a valid offset. NA to dart

  shouldThrow(() => select.item());
}
