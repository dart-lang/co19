/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test to make sure text-underline-position property returns
 * values properly.
 */
import "dart:html";
import "../../../../testcommon.dart";

main() {
  var e;

  testElementStyle(type, value)
  {
    if (type != null) {
      shouldBe(e.style.textUnderlinePosition, value);
      shouldBe(e.style.getPropertyValue("text-underline-position"), value);
    } else
      //shouldBeNull(e.style.getPropertyValue("text-underline-position"));
      shouldBe(e.style.getPropertyValue("text-underline-position"), '');
  }

  testComputedStyle(type, value)
  {
    var computedStyle = getComputedStyle(e, null);
    shouldBe(computedStyle.textUnderlinePosition, value);
    shouldBe(computedStyle.getPropertyValue("text-underline-position"), value);
  }

  // FIXME: This test tests property values 'auto' and 'under'. We don't fully match
  // the specification as we don't support [ left | right ] and this is left for another implementation
  // as the rendering will need to be added.

  var testContainer = document.createElement("div");
  testContainer.contentEditable = 'true';
  document.body.append(testContainer);

  testContainer.innerHtml = '<div id="test">hello world</div>';

  debug("Initial value:");
  e = document.getElementById('test');
  testElementStyle(null, '');
  testComputedStyle(String, "auto");
  debug('');

  debug("Value '':");
  e.style.textUnderlinePosition = '';
  testElementStyle(null, '');
  testComputedStyle(String, "auto");
  debug('');

  debug("Initial value (explicit):");
  e.style.textUnderlinePosition = 'initial';
  testElementStyle(String, "initial");
  testComputedStyle(String, "auto");
  debug('');

  debug("Value 'auto':");
  e.style.textUnderlinePosition = 'auto';
  testElementStyle(String, "auto");
  testComputedStyle(String, "auto");
  debug('');

  debug("Value 'under':");
  e.style.textUnderlinePosition = 'under';
  testElementStyle(String, "under");
  testComputedStyle(String, "under");
  debug('');

  testContainer.setInnerHtml('<div id="test-parent" style="text-underline-position: under;">hello <span id="test-ancestor">world</span></div>',
      treeSanitizer: new NullTreeSanitizer());
  debug("Ancestor inherits values from parent:");
  e = document.getElementById('test-ancestor');
  testElementStyle(null, "");
  testComputedStyle(String, "under");
  debug('');

  debug("Value 'auto under':");
  e.style.textUnderlinePosition = 'auto under';
  testElementStyle(null, "");
  debug('');

  debug("Value 'under under':");
  e.style.textUnderlinePosition = 'under under';
  testElementStyle(null, "");
  debug('');

  debug("Value 'under under under':");
  e.style.textUnderlinePosition = 'auto alphabetic under';
  testElementStyle(null, "");
  debug('');
}
