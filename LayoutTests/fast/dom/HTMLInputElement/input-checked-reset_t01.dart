/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that check-type input form controls are 
 * properly reset by both a reset input control and a reset button control.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form>
    <input id="checkboxUnchecked" type="checkbox" value="Unchecked"><br>
    <input id="checkboxChecked" type="checkbox" value="Checked" checked="checked"><br>
    <input id="radioUnchecked" name="radio1" type="radio" value="Unchecked"><br>
    <input id="radioChecked" name="radio1" type="radio" value="Checked" checked="checked"><br>

    <input id="inputReset" type="reset">
    <button id="buttonReset" type="reset">Reset Button</button>
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  var inputReset = document.getElementById("inputReset");
  var buttonReset = document.getElementById("buttonReset");

  testChecked(testElement, expected, button)
  {
    var success = false;
    if (testElement.checked == expected)
    {
      testElement.checked = !expected;
      button.click();
      if (testElement.checked == expected)
        success = true;
    }
    shouldBeTrue(success);
  }

  test(elementId, expected)
  {
    var element = document.getElementById(elementId);
    debug(elementId + " inputReset");
    testChecked(element, expected, inputReset);
    debug(elementId + " buttonReset");
    testChecked(element, expected, buttonReset);
  }

  test("checkboxUnchecked", false);
  test("checkboxChecked", true);
  test("radioUnchecked", false);
  test("radioChecked", true);
}
