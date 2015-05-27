/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for .value and .label of OPTION element
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <select>
      <option id="o1">text</option>
      <option id="o2" value="value">text</option>
      <option id="o3" label="label">text</option>
      <option id="o4" value="value" label="label">text</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  var o1 = document.getElementById('o1');
  shouldBe(o1.value, "text");
  shouldBe(o1.label, "text");

  var o2 = document.getElementById('o2');
  shouldBe(o2.value, "value");
  shouldBe(o2.label, "text");

  var o3 = document.getElementById('o3');
  shouldBe(o3.value, "text");
  shouldBe(o3.label, "label");

  var o4 = document.getElementById('o4');
  shouldBe(o4.value, "value");
  shouldBe(o4.label, "label");
}
