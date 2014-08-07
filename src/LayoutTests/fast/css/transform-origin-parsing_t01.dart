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
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  test(declaration, property) {
    var div = document.createElement("div");
    div.setAttribute("style", declaration);
    document.body.append(div);

    var result = div.style.getPropertyValue(property);
    div.remove();
    return result;
  }

  shouldBe(test("-webkit-transform-origin: 10% 10% 10%", "-webkit-transform-origin"), '');
  shouldBe(test("-webkit-transform-origin: 10% 10% 10px", "-webkit-transform-origin"), "10% 10% 10px");
  shouldBe(test("-webkit-transform-origin: 10px 10px 10%", "-webkit-transform-origin"), '');
  shouldBe(test("-webkit-transform-origin: 10px 10px 10px", "-webkit-transform-origin"), "10px 10px 10px");
  shouldBe(test("-webkit-transform-origin: left top 10%", "-webkit-transform-origin"), '');
  shouldBe(test("-webkit-transform-origin: left top 10px", "-webkit-transform-origin"), "0% 0% 10px");
  shouldBe(test("-webkit-transform-origin: left top left", "-webkit-transform-origin"), '');
}
