/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests checks that the sticky value for position parses
 * correctly.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css"></style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  test(value) {
    var div = document.createElement("div");
    div.setAttribute("style", value);
    document.body.append(div);

    var result = div.style.getPropertyValue("position");
    div.remove();
    return result;
  }

  shouldBe(test("position: sticky;"), "sticky");
}

