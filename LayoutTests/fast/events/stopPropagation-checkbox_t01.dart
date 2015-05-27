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
      <p>This test checks whether event.stopPropagation() prevents the
      default action. It should not!

      </p>
      <input type="checkbox" id="checkbox1" value="click here">
      <input type="checkbox" id="checkbox2" value="click here">
      <p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var checkbox1 = document.getElementById("checkbox1");
  checkbox1.onClick.listen((event) => event.stopPropagation());
  checkbox1.click();
  var checkbox2 = document.getElementById("checkbox2");
  checkbox2.onClick.listen((event) => event.preventDefault()); 
  checkbox2.click();

  shouldBeTrue(checkbox1.checked);
  shouldBeFalse(checkbox2.checked);
}
