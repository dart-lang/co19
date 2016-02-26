/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks parsing of the '-webkit-transform-origin'
 * property and in particular that specifying invalid z values discards the
 * property.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  if (document.documentElement.style.supportsProperty("-webkit-transform-origin")) {
    test(declaration, property) {
      var div = document.createElement("div");
      div.setAttribute("style", declaration);
      document.body.append(div);

      var result = div.style.getPropertyValue(property);
      div.remove();
      return result;
    }

    shouldBeLikeString(test(
        "-webkit-transform-origin: 10% 10% 10%", "-webkit-transform-origin"),
        '');
    shouldBeLikeString(test(
        "-webkit-transform-origin: 10% 10% 10px", "-webkit-transform-origin"),
        "10% 10% 10px");
    shouldBeLikeString(test(
        "-webkit-transform-origin: 10px 10px 10%", "-webkit-transform-origin"),
        '');
    shouldBeLikeString(test(
        "-webkit-transform-origin: 10px 10px 10px", "-webkit-transform-origin"),
        "10px 10px 10px");
    shouldBeLikeString(test(
        "-webkit-transform-origin: left top 10%", "-webkit-transform-origin"),
        '');
    shouldBeLikeString(test(
        "-webkit-transform-origin: left top 10px", "-webkit-transform-origin"),
        "left top 10px");
    shouldBeLikeString(test(
        "-webkit-transform-origin: left top left", "-webkit-transform-origin"),
        '');
  }
}
