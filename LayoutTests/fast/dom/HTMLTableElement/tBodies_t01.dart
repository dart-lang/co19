/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test behavior of the HTMLTableElement tBodies attribute in
 * cases where there is unusual nesting.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  checkTBodyNesting(tag)
  {
    debug(tag);
    TableElement table = document.createElement("table");
    var container = document.createElement(tag);
    var tbody = document.createElement("tbody");
    table.append(container);
    container.append(tbody);
    return table.tBodies.length;
  }

  var tags = [
    "col",
    "colgroup",
    "div",
    "form",
    "script",
    "table",
    "td",
    "tfoot",
    "th",
    "thead",
    "tr",
  ];

  for (var i = 0; i < tags.length; ++i)
    shouldBe(checkTBodyNesting(tags[i]), 0);

  shouldBe(checkTBodyNesting("tbody"), 1);
}
