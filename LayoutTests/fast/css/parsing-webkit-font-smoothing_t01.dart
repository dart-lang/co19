/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks that all of the input values for
 * -webkit-font-smoothing parse correctly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css"></style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  test(value)
  {
    var span = document.createElement("span");
    span.setAttribute("style", value);
    document.body.append(span);

    var result = span.style.getPropertyValue("-webkit-font-smoothing");
    span.remove();
    return result;
  }

  shouldBe(test("-webkit-font-smoothing: auto;"), "auto");
  shouldBe(test("-webkit-font-smoothing: none;"), "none");
  shouldBe(test("-webkit-font-smoothing: antialiased;"), "antialiased");
  shouldBe(test("-webkit-font-smoothing: subpixel-antialiased;"), "subpixel-antialiased");

  //shouldBe(test("-webkit-font-smoothing: apple;"), null);
  //shouldBe(test("-webkit-font-smoothing: 15;"), null);
  //shouldBe(test("-webkit-font-smoothing: auto auto;"), null);
  shouldBe(test("-webkit-font-smoothing: apple;"), '');
  shouldBe(test("-webkit-font-smoothing: 15;"), '');
  shouldBe(test("-webkit-font-smoothing: auto auto;"), '');
}
