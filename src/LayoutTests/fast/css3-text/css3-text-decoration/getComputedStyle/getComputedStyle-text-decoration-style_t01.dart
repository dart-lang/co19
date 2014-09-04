/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure text-decoration-style property returns
 * CSSPrimitiveValue properly.
 */
import "dart:html";
import "../../../../testcommon.dart";
import "../../../../../Utils/async_utils.dart";

main() {
  var e;

  testElementStyle(type, value)
  {
    if (type != null) {
      shouldBe(e.style.textDecorationStyle, value);
      shouldBe(e.style.getPropertyValue('text-decoration-style'), value);
    } else
      //shouldBeNull(e.style.getPropertyValue('text-decoration-style'));
      shouldBe(e.style.getPropertyValue('text-decoration-style'), '');
  }

  testComputedStyleValue(type, value)
  {
    var computedStyle = getComputedStyle(e, null);
    shouldBe(computedStyle.getPropertyValue('text-decoration-style'), value);
    shouldBe(computedStyle.textDecorationStyle, value);
  }

  testValue(value, elementValue, elementStyle, computedValue, computedStyle)
  {
    if (value != null)
      e.style.textDecorationStyle = value;
    testElementStyle(elementStyle, elementValue);
    testComputedStyleValue(computedStyle, computedValue);
    debug('');
  }

  var testContainer = document.createElement("div");
  testContainer.contentEditable = 'true';
  document.body.append(testContainer);

  testContainer.setInnerHtml('<div id="test-parent" style="text-decoration-style: dashed !important;">hello <span id="test-ancestor">world</span></div>',
      treeSanitizer: new NullTreeSanitizer());
  debug("Ancestor should not inherit 'dashed' value from parent (fallback to initial 'solid' value):");
  e = document.getElementById('test-ancestor');
  testValue(null, "", null, "solid", String);

  debug("Parent should cointain 'dashed':");
  e = document.getElementById('test-parent');
  testValue(null, "dashed", String, "dashed", String);

  testContainer.innerHtml = '<div id="test-js">test</div>';
  debug("JavaScript setter tests for valid, initial, invalid and blank values:");
  e = document.getElementById('test-js');
  //shouldBeNull(e.style.getPropertyValue('text-decoration-style'));
  shouldBe(e.style.getPropertyValue('text-decoration-style'), '');

  debug("\nValid value 'solid':");
  testValue("solid", "solid", String, "solid", String);

  debug("Valid value 'double':");
  testValue("double", "double", String, "double", String);

  debug("Valid value 'dotted':");
  testValue("dotted", "dotted", String, "dotted", String);

  debug("Valid value 'dashed':");
  testValue("dashed", "dashed", String, "dashed", String);

  debug("Valid value 'wavy':");
  testValue("wavy", "wavy", String, "wavy", String);

  debug("Initial value:");
  testValue("initial", "initial", String, "solid", String);

  debug("Invalid value (this property accepts one value at a time only):");
  testValue("double dotted", "initial", String, "solid", String);

  debug("Invalid value (ie. 'unknown'):");
  testValue("unknown", "initial", String, "solid", String);

  debug("Empty value (resets the property):");
  testValue("", "", null, "solid", String);
}
