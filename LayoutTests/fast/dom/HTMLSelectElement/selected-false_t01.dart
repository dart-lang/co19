/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <select size="1"> 
        <option id="opt1" value="1">1</option> 
        <option id="opt2" value="2">2</option>
        <option id="opt2" value="3">3</option> 
    </select>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement selectElement = document.getElementsByTagName('select')[0];
  List optionElements = document.getElementsByTagName('option');

  selectElement.selectedIndex = 0;
  shouldBe(selectElement.selectedIndex, 0);
  shouldBe(optionElements[0].selected, true);
  shouldBe(optionElements[1].selected, false);
  shouldBe(optionElements[2].selected, false);

  selectElement.selectedIndex = -1;
  shouldBe(selectElement.selectedIndex, -1);

  shouldBe(optionElements[0].selected, false);
  shouldBe(optionElements[1].selected, false);
  shouldBe(optionElements[2].selected, false);

  selectElement.selectedIndex = -2;
  shouldBe(selectElement.selectedIndex, -1);

  optionElements[2].selected = true;
  optionElements[1].selected = true;
  shouldBe(selectElement.selectedIndex, 1);
  shouldBe(optionElements[0].selected, false);
  shouldBe(optionElements[1].selected, true);
  shouldBe(optionElements[2].selected, false);

  optionElements[1].selected = true;
  optionElements[2].selected = true;
  shouldBe(selectElement.selectedIndex, 2);
  shouldBe(optionElements[0].selected, false);
  shouldBe(optionElements[1].selected, false);
  shouldBe(optionElements[2].selected, true);

  optionElements[0].selected = false;
  optionElements[2].selected = false;
  shouldBe(selectElement.selectedIndex, 0);
  shouldBe(optionElements[0].selected, true);
  shouldBe(optionElements[1].selected, false);
  shouldBe(optionElements[2].selected, false);

  optionElements[0].disabled = true;
  optionElements[0].selected = false;
  shouldBe(selectElement.selectedIndex, 1);
  shouldBe(optionElements[0].selected, false);
  shouldBe(optionElements[1].selected, true);
  shouldBe(optionElements[2].selected, false);
}
