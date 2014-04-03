/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test verifies that text-type input form controls are 
 * properly reset by both a reset input control and a reset button control.
 * (But file input element values can't be modified by JS, so this test can't
 * be used for those.)
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <form>
    <input id="textEmpty" type="text"><br>
    <input id="textValue" type="text" value="Default Value"><br>
    <input id="passwordEmpty" type="password"><br>
    <input id="passwordValue" type="password" value="Default Value"><br>
    <input id="hiddenEmpty" type="hidden"><br>
    <input id="hiddenValue" type="hidden" value="Default Value">

    <input id="inputReset" type="reset">
    <button id="buttonReset" type="reset">Reset Button</button>
    </form>
    ''', treeSanitizer: new NullTreeSanitizer());

  var inputReset = document.getElementById("inputReset");
  var buttonReset = document.getElementById("buttonReset");

  testValue(testElement, expected, button)
  {
    var success = false;
    if (testElement.value == expected)
    {
      testElement.value = "Not Expected! " + expected;
      button.click();
      if (testElement.value == expected)
        success = true;
    }
    shouldBeTrue(success);
  }

  test(elementId, expected)
  {
    var element = document.getElementById(elementId);
    debug(elementId + " inputReset");
    testValue(element, expected, inputReset);
    debug(elementId + " buttonReset");
    testValue(element, expected, buttonReset);
  }

  test("textEmpty", "");
  test("textValue", "Default Value");
  test("passwordEmpty", "");
  test("passwordValue", "Default Value");
}
