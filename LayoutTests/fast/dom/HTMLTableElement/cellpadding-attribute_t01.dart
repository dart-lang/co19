/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description HTMLTableElement cellpadding attribute test
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  cellPaddingAttributeEffect(value)
  {
    var table = document.createElement("table");
    table.setAttribute("cellpadding", value);
    var cell = document.createElement("td");
    table.append(cell);
    document.body.append(table);
    var computedStyle = cell.getComputedStyle();
    var result = computedStyle.paddingTop;
    table.remove();
    return result;
  }

  shouldBe(cellPaddingAttributeEffect(""), "1px");

  shouldBe(cellPaddingAttributeEffect("1"), "1px");
  shouldBe(cellPaddingAttributeEffect("2"), "2px");
  shouldBe(cellPaddingAttributeEffect("10"), "10px");

  shouldBe(cellPaddingAttributeEffect("0"), "0px");

  shouldBe(cellPaddingAttributeEffect("-1"), "0px");

  shouldBe(cellPaddingAttributeEffect("1x"), "1px");
  shouldBe(cellPaddingAttributeEffect("1."), "1px");
  shouldBe(cellPaddingAttributeEffect("1.9"), "1px");
  shouldBe(cellPaddingAttributeEffect("2x"), "2px");
  shouldBe(cellPaddingAttributeEffect("2."), "2px");
  shouldBe(cellPaddingAttributeEffect("2.9"), "2px");

  shouldBe(cellPaddingAttributeEffect("a"), "0px");

  var arabicIndicDigitOne = new String.fromCharCode(0x661);
  shouldBe(cellPaddingAttributeEffect(arabicIndicDigitOne), "0px");
  shouldBe(cellPaddingAttributeEffect("2" + arabicIndicDigitOne), "2px");
}
