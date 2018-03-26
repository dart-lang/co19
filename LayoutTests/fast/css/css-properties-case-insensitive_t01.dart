/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description getPropertyValue should be case insensitive
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  document.body.setInnerHtml('''
     <p>Property names retrieved by getPropertyValue, setProperty, removeProperty and others must be treated as case insensitive. This test ensures that they are.</p>
     <p>References</p>
     <ul>
     <li><a href="http://bugs.webkit.org/show_bug.cgi?id=14645">http://bugs.webkit.org/show_bug.cgi?id=14645</a></li>
     <li><a href="http://www.w3.org/TR/CSS1#forward-compatible-parsing">http://www.w3.org/TR/CSS1#forward-compatible-parsing</a></li>
     </ul>
     <p id="test">This paragraph should be green, and not bold when the test completes.</p>
     <pre id='console'></pre>
     ''', treeSanitizer: new NullTreeSanitizer());

  test()
  {
    var test;
    var lowerValue, upperValue;

    test = document.getElementById('test');
    lowerValue = getComputedStyle(test).getPropertyValue("width");
    upperValue = getComputedStyle(test).getPropertyValue("WIDTH");
    debug("getPropertyValue");
    shouldBe(lowerValue, upperValue);

    test.style.setProperty("color", "#ff0000", null);
    test.style.setProperty("COLOR", "#00cc00", null);
    lowerValue = getComputedStyle(test).getPropertyValue("color");
    debug("setProperty");
    shouldBe(lowerValue, "rgb(0, 204, 0)");

    test.style.setProperty("font-weight", "bold", null);
    test.style.removeProperty("FONT-WEIGHT");
    lowerValue = getComputedStyle(test).getPropertyValue("font-weight");
    debug("removeProperty");
    shouldBeTrue(lowerValue=="400" || lowerValue=="normal");
  }

  test();
}
