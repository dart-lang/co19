/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test behavior of the HTMLTableElement rows attribute in cases
 * where there is unusual nesting.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  checkNoBodyRowNesting(tag)
  {
    debug('checkNoBodyRowNesting $tag');
    TableElement table = document.createElement("table");
    var container = document.createElement(tag);
    var row = document.createElement("tr");
    table.append(container);
    container.append(row);
    return table.rows.length;
  }

  checkRowNesting(tag)
  {
    debug('checkRowNesting $tag');
    TableElement table = document.createElement("table");
    var body = document.createElement("tbody");
    var container = document.createElement(tag);
    var row = document.createElement("tr");
    table.append(body);
    body.append(container);
    container.append(row);
    return table.rows.length;
  }

  var sectionTags = [
    "tbody",
    "tfoot",
    "thead",
  ];

  var otherTags = [
    "col",
    "colgroup",
    "div",
    "form",
    "script",
    "table",
    "td",
    "th",
  ];

  for (var i = 0; i < otherTags.length; ++i)
    shouldBe(checkRowNesting(otherTags[i]), 0);

  for (var i = 0; i < sectionTags.length; ++i)
    shouldBe(checkRowNesting(sectionTags[i]), 0);

  shouldBe(checkRowNesting("tr"), 1);

  for (var i = 0; i < otherTags.length; ++i)
    shouldBe(checkNoBodyRowNesting(otherTags[i]), 0);

  for (var i = 0; i < sectionTags.length; ++i)
    shouldBe(checkNoBodyRowNesting(sectionTags[i]), 1);

  shouldBe(checkNoBodyRowNesting("tr"), 1);
}
