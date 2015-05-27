/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test behavior of the HTMLTableRowElement cells attribute in
 * cases where there is unusual nesting.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  checkCellNesting(tag)
  {
    debug('checkCellNesting $tag');
    var row = document.createElement("tr");
    var container = document.createElement(tag);
    var cell = document.createElement("td");
    row.append(container);
    container.append(cell);
    return row.cells.length;
  }

  checkHeaderCellNesting(tag)
  {
    debug('checkHeaderCellNesting $tag');
    var row = document.createElement("tr");
    var container = document.createElement(tag);
    var cell = document.createElement("th");
    row.append(container);
    container.append(cell);
    return row.cells.length;
  }

  var tags = [
    "col",
    "colgroup",
    "div",
    "form",
    "script",
    "table",
    "tbody",
    "tfoot",
    "thead",
    "tr",
  ];

  for (var i = 0; i < tags.length; ++i)
    shouldBe(checkCellNesting(tags[i]), 0);

  shouldBe(checkCellNesting("td"), 1);
  shouldBe(checkCellNesting("th"), 1);

  for (var i = 0; i < tags.length; ++i)
    shouldBe(checkHeaderCellNesting(tags[i]), 0);

  shouldBe(checkHeaderCellNesting("td"), 1);
  shouldBe(checkHeaderCellNesting("th"), 1);
}
