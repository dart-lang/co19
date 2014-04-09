/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <select multiple="true"> 
        <option id="opt1" value="1">1</option> 
        <option id="opt2" value="2">2</option>
        <option id="opt2" value="3">3</option> 
    </select>
    <select> 
        <option id="opt1" value="1">1</option> 
        <option id="opt2" value="2">2</option>
        <option id="opt2" value="3">3</option> 
    </select>
    <select multiple="true" style="display: none;"> 
        <option id="opt1" value="1">1</option> 
        <option id="opt2" value="2">2</option>
        <option id="opt2" value="3">3</option> 
    </select>
    <select style="display: none;"> 
        <option id="opt1" value="1">1</option> 
        <option id="opt2" value="2">2</option>
        <option id="opt2" value="3">3</option> 
    </select>
    <select multiple="true"> 
        <option id="opt1" value="1" selected="selected">1</option> 
        <option id="opt2" value="2" selected="selected">2</option>
        <option id="opt2" value="3">3</option> 
    </select>
    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var selectElement;

  // <select multiple="true"> should not have a selection by default.
  selectElement = document.getElementsByTagName('select')[0];
  shouldBe(selectElement.selectedIndex, -1);

  // Preserve selection on conversion.
  selectElement.multiple = false;
  shouldBe(selectElement.selectedIndex, -1);

  // <select multiple="false"> should have a selection by default and that
  // selection should be preserved.
  selectElement = document.getElementsByTagName('select')[1];
  selectElement.multiple = true;
  shouldBe(selectElement.selectedIndex, 0);

  // Test the same cases as above but with selects that start out with
  // display: none.
  selectElement = document.getElementsByTagName('select')[2];
  selectElement.style.display = '';
  shouldBe(selectElement.selectedIndex, -1);
  selectElement.multiple = false;
  shouldBe(selectElement.selectedIndex, -1);

  selectElement = document.getElementsByTagName('select')[3];
  selectElement.style.display = '';
  selectElement.multiple = true;
  shouldBe(selectElement.selectedIndex, 0);

  // Test resetting the multiple attribute.
  selectElement = document.getElementsByTagName('select')[4];
  shouldBe(selectElement.options[0].selected, true);
  shouldBe(selectElement.options[1].selected, true);
  shouldBe(selectElement.options[2].selected, false);
  selectElement.multiple = true;
  shouldBe(selectElement.options[0].selected, true);
  shouldBe(selectElement.options[1].selected, true);
  shouldBe(selectElement.options[2].selected, false);
  selectElement.multiple = false;
  shouldBe(selectElement.options[0].selected, true);
  shouldBe(selectElement.options[1].selected, false);
  shouldBe(selectElement.options[2].selected, false);
}
