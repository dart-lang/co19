/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the mapping of length-type attributes to CSS length
 * values.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <img id="img" style="display: none;">
    <table><col id="col" style="display: none;"></table>
      ''', treeSanitizer: new NullTreeSanitizer());

  test(target, value, [expected])
  {
    target.setAttribute("height", value);
    var actual = target.getComputedStyle().height;
    expected = expected != null ? expected : "auto";
    shouldBe(actual, expected);
  }

  var img = document.getElementById("img");
  debug ("<img>:");
  test(img, "90zz", "90px");
  test(img, "80%", "80%");
  test(img, "70%5", "70%");
  test(img, "60%%", "60%");
  test(img, "50*");
  test(img, "40*5");
  test(img, "30.5", "30.5px");

  var col = document.getElementById("col");
  debug("<col>:");
  test(col, "90zz", "90px");
  test(col, "80%", "80%");
  test(col, "70%5", "70%");
  test(col, "60%%", "60%");
  test(col, "50*");
  test(col, "40*5");
  test(col, "30.5", "30.5px");
}
