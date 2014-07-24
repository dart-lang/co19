/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks that all of the input values for
 * background-repeat parse correctly.
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

    var result = div.style.getPropertyValue("text-rendering");
    div.remove();
    return result;
  }

  shouldBe(test("text-rendering: auto;"), "auto");
  shouldBe(test("text-rendering: optimizeSpeed;"), "optimizespeed");
  shouldBe(test("text-rendering: optimizeLegibility;"), "optimizelegibility");
  shouldBe(test("text-rendering: geometricPrecision;"), "geometricprecision");

  shouldBeNull(x) => shouldBe(x, '');

  shouldBeNull(test("text-rendering: auto auto;"));
  shouldBeNull(test("text-rendering: optimizeCoconuts;"));
  shouldBeNull(test("text-rendering: 15;"));
}
