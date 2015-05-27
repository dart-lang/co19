/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure text-decoration-line property returns values
 * properly.
 */
import "dart:html";
import "../../../../testcommon.dart";
import "../../../../../Utils/async_utils.dart";

main() {
  var e;

  testElementStyle(type, value)
  {
    if (type != null) {
      shouldBe(e.style.textDecorationLine, value);
      shouldBe(e.style.getPropertyValue("text-decoration-line"), value);
    } else
      //shouldBeNull(e.style.getPropertyValue("text-decoration-line"));
      shouldBe(e.style.getPropertyValue("text-decoration-line"), '');
  }

  testComputedStyle(type, value)
  {
    var computedStyle = getComputedStyle(e, null);
    shouldBe(computedStyle.textDecorationLine, value);
    shouldBe(computedStyle.getPropertyValue("text-decoration-line"), value);
  }

  var testContainer = document.createElement("div");
  testContainer.contentEditable = 'true';
  document.body.append(testContainer);

  testContainer.innerHtml = '<div id="test">hello world</div>';
  debug("Initial value:");
  e = document.getElementById('test');
  testElementStyle(null, '');
  testComputedStyle(String, "none");
  debug('');

  debug("Initial value (explicit):");
  e.style.textDecorationLine = 'initial';
  testElementStyle(String, "initial");
  testComputedStyle(String, "none");
  debug('');

  debug("Value 'none':");
  e.style.textDecorationLine = 'none';
  testElementStyle(String, "none");
  testComputedStyle(String, "none");
  debug('');

  debug("Value 'underline':");
  e.style.textDecorationLine = 'underline';
  testElementStyle(String, "underline");
  testComputedStyle(String, "underline");
  debug('');

  debug("Value 'overline':");
  e.style.textDecorationLine = 'overline';
  testElementStyle(String, "overline");
  testComputedStyle(String, "overline");
  debug('');

  debug("Value 'line-through':");
  e.style.textDecorationLine = 'line-through';
  testElementStyle(String, "line-through");
  testComputedStyle(String, "line-through");
  debug('');

  debug("Value 'blink' (valid, but ignored on computed style):");
  e.style.textDecorationLine = 'blink';
  testElementStyle(String, "blink");
  testComputedStyle(String, "none");
  debug('');

  debug("Value 'underline overline line-through blink':");
  e.style.textDecorationLine = 'underline overline line-through blink';
  testElementStyle(String, "underline overline line-through blink");
  testComputedStyle(String, "underline overline line-through");
  debug('');

  debug("Value '':");
  e.style.textDecorationLine = '';
  testElementStyle(null, '');
  testComputedStyle(String, "none");
  debug('');

  testContainer.setInnerHtml('<div id="test-parent" style="text-decoration-line: underline;">hello <span id="test-ancestor" style="text-decoration-line: inherit;">world</span></div>',
      treeSanitizer: new NullTreeSanitizer());
  debug("Parent gets 'underline' value:");
  e = document.getElementById('test-parent');
  testElementStyle(String, "underline");
  testComputedStyle(String, "underline");
  debug('');

  debug("Ancestor should explicitly inherit value from parent when 'inherit' value is used:");
  e = document.getElementById('test-ancestor');
  testElementStyle(String, "inherit");
  testComputedStyle(String, "underline");
  debug('');

  debug("Ancestor should not implicitly inherit value from parent (i.e. when value is void):");
  e.style.textDecorationLine = '';
  testElementStyle(null, '');
  testComputedStyle(String, "none");
  debug('');
}
