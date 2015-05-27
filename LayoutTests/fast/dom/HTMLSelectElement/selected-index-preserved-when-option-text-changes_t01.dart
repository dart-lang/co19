/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Fix for bug 70547-- changing the text of an option in a select
 * element with no selected option (-1) should preserve that option
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <select id="theSelect">
    <option>Item 1</option>
    <option>Item 2</option>
    <option>Item 3</option>
    </select>
    <select id="theSelect2" multiple>
    <option>Item 1</option>
    <option>Item 2</option>
    <option>Item 3</option>
    <option>Item 4</option>
    <option>Item 5</option>
    </select>

    <div id="console"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var mySelect;

  runTest() {
    debug("Setting selected index to -1");
    mySelect.selectedIndex = -1;
    mySelect.options[0].text = "Changed text for item 1";
    debug("Changed text attribute of first item");
    shouldBe(mySelect.selectedIndex, -1);

    mySelect.selectedIndex = -1;
    mySelect.options[0].value = "Changed value for item 1";
    debug("Changed value attribute of first item");
    shouldBe(mySelect.selectedIndex, -1);
    
    mySelect.selectedIndex = -1;
    mySelect.options[0].label = "Changed label for item 1";
    debug("Changed label attribute of first item");
    shouldBe(mySelect.selectedIndex, -1);

    debug("Setting selected index to 1");
    mySelect.selectedIndex = 1;
    mySelect.options[0].text = "Changed text for item 1";
    debug("Changed text attribute of first item");
    shouldBe(mySelect.selectedIndex, 1);
    
    mySelect.selectedIndex = 1;
    mySelect.options[0].value = "Changed value for item 1";
    debug("Changed value attribute of first item");
    shouldBe(mySelect.selectedIndex, 1);

    mySelect.selectedIndex = 1;
    mySelect.options[0].label = "Changed label for item 1";
    debug("Changed label attribute of first item");
    shouldBe(mySelect.selectedIndex, 1);
  }

  mySelect = document.getElementById("theSelect");
  debug("Running tests on menu list");
  runTest();

  mySelect = document.getElementById("theSelect2");
  debug("Running tests on list box");
  runTest();
}

