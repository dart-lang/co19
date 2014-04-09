/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that list-box-style select form controls 
 * with no "selected" attributes are properly cleared when reset.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form>
    <select id="multiSelectElement" multiple="mulitple">
    <option>one</option>
    <option>two</option>
    <option>three</option>
    </select>
    <select id="singleSelectElement" size="3">
    <option>one</option>
    <option>two</option>
    <option>three</option>
    </select>
    <input id="resetButton" type="reset">
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  var button = document.getElementById("resetButton");

  test(elementId)
  {
    debug(elementId);
    var testSelectElement = document.getElementById(elementId);
    var result = "FAILED";
    if (testSelectElement.selectedIndex == -1)
    {
      testSelectElement.selectedIndex = 1;
      button.click();
      if (testSelectElement.selectedIndex == -1)
        result = "SUCCESS";
    }
    shouldBe(result, "SUCCESS");
  }

  test("multiSelectElement");
  test("singleSelectElement");
}
