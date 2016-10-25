/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure text-decoration-color property returns
 * CSSPrimitiveValue properly.
 */
import "dart:html";
import "../../../../testcommon.dart";

main() {
  var e;

  testElementStyle(type, value)
  {
    if (type != null) {
      shouldBe(e.style.textDecorationColor, value);
      shouldBe(e.style.getPropertyValue('text-decoration-color'), value);
    } else
      //shouldBeNull(e.style.getPropertyValue('text-decoration-color'));
      shouldBe(e.style.getPropertyValue('text-decoration-color'), '');
  }

  testComputedStyleValue(type, value)
  {
    var computedStyle = getComputedStyle(e, null);
    shouldBe(computedStyle.getPropertyValue('text-decoration-color'), value);
    shouldBe(computedStyle.textDecorationColor, value);
  }

  testValue(value, elementValue, elementStyle, computedValue, computedStyle)
  {
    if (value != null)
      e.style.textDecorationColor = value;
    testElementStyle(elementStyle, elementValue);
    testComputedStyleValue(computedStyle, computedValue);
    debug('');
  }

  var testContainer = document.createElement("div");
  testContainer.contentEditable = 'true';
  document.body.append(testContainer);

  testContainer.setInnerHtml('<div id="test-parent" style="text-decoration-color: green !important;">hello <span id="test-ancestor">world</span></div>',
      treeSanitizer: new NullTreeSanitizer());
  debug("Ancestor should not inherit 'green' value from parent (fallback to initial value):");
  e = document.getElementById('test-ancestor');
  testValue(null, "", null, "rgb(0, 0, 0)", String);

  debug("Parent should contain 'green':");
  e = document.getElementById('test-parent');
  testValue(null, "green", String, "rgb(0, 128, 0)", String);

  testContainer.innerHtml = '<div id="test-js">test</div>';
  debug("JavaScript setter tests for valid, initial, invalid and blank values:");
  e = document.getElementById('test-js');
  //shouldBeNull(e.style.getPropertyValue('text-decoration-color'));
  shouldBe(e.style.getPropertyValue('text-decoration-color'), '');

  debug("\nValid value 'blue':");
  testValue("blue", "blue", String, "rgb(0, 0, 255)", String);

  debug("Valid value '#FFFFFF':");
  testValue("#FFFFFF", "rgb(255, 255, 255)", String, "rgb(255, 255, 255)", String);

  debug("Valid value 'rgb(0, 255, 0)':");
  testValue("rgb(0, 255, 0)", "rgb(0, 255, 0)", String, "rgb(0, 255, 0)", String);

  debug("Valid value 'rgba(100, 100, 100, 0.5)':");
  testValue("rgba(100, 100, 100, 0.5)", "rgba(100, 100, 100, 0.498039)", String, "rgba(100, 100, 100, 0.498039)", String);

  debug("Valid value 'hsl(240, 100%, 50%)':");
  testValue("hsl(240, 100%, 50%)", "rgb(0, 0, 255)", String, "rgb(0, 0, 255)", String);

  debug("Valid value 'hsla(240, 100%, 50%, 0.5)':");
  testValue("hsla(240, 100%, 50%, 0.5)", "rgba(0, 0, 255, 0.498039)", String, "rgba(0, 0, 255, 0.498039)", String);

  debug("Initial value:");
  testValue("initial", "initial", String, "rgb(0, 0, 0)", String);

  debug("Invalid value (ie. 'unknown'):");
  testValue("unknown", "initial", String, "rgb(0, 0, 0)", String);

  debug("Empty value (resets the property):");
  testValue("", "", null, "rgb(0, 0, 0)", String);

  debug("Empty value with different 'currentColor' initial value (green):");
  e.style.color = 'green';
  testValue("", "", null, "rgb(0, 128, 0)", String);
}
