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
import "pwd.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var families = [
    "serif",
    "sans-serif",
    "cursive",
    "fantasy",
    "monospace"
  ];

  for (var i = 0; i < families.length; i++) {
    var family = families[i];
    var div = document.createElement("div");
    div.setAttribute("style", "font-family: " + family);
    document.body.append(div);

    var returnedFamily = getComputedStyle(div).fontFamily;

    debug(family);
    shouldBe(family, returnedFamily);
  }
}
