/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks that all of the input values for object-fit
 * parse correctly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  test(value)
  {
    var div = document.createElement("div");
    div.setAttribute("style", value);
    document.body.append(div);

    var result = div.style.getPropertyValue("object-fit");
    div.remove();
    return result;
  }

  testComputedStyle(value)
  {
    var div = document.createElement("div");
    div.setAttribute("style", value);
    document.body.append(div);

    //var result = getComputedStyle(div).objectFit;
    var result = getComputedStyle(div).getPropertyValue("object-fit");
    div.remove();
    return result;
  }

  shouldBe(testComputedStyle(";"), "fill");
  shouldBe(test("object-fit: inherit;"), "inherit");
  shouldBe(test("object-fit: initial;"), "initial");
  shouldBe(test("object-fit: fill;"), "fill");
  shouldBe(test("object-fit: contain;"), "contain");
  shouldBe(test("object-fit: cover;"), "cover");
  shouldBe(test("object-fit: none;"), "none");
  shouldBe(test("object-fit: scale-down;"), "scale-down");

  /*shouldBeNull(test("object-fit: fill contain;"));
  shouldBeNull(test("object-fit: bananas;"));
  shouldBeNull(test("object-fit: 23px;"));
  shouldBeNull(test("object-fit: 20%;"));*/

  shouldBe(test("object-fit: fill contain;"), '');
  shouldBe(test("object-fit: bananas;"), '');
  shouldBe(test("object-fit: 23px;"), '');
  shouldBe(test("object-fit: 20%;"), '');
}
