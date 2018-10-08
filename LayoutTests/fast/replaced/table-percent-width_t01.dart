/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description webkit.org/b/29447: Replaced elements squeezed when width is specified as percentage inside a table with Auto layout
 */
import "dart:html";
import "../../testharness.dart";

const String squareBlue = "$testSuiteRoot/fast/replaced/resources/square-blue-100x100.png";

const String htmlEL2 = '''
   <table>
    <tr>
    <td>
      <img id="img-1" src="$squareBlue" width="100%" align="LEFT" border="1">
    </td>
    </tr>
   </table>

   <table>
    <tr>
    <td>
      <img id="img-2" src="$squareBlue" height="100%" align="LEFT" border="1">
    </td>
    </tr>
   </table>

   <table height="50" width="50" border="1">
    <tr>
    <td>
      <img id="img-3" src="$squareBlue" width="100%" align="LEFT" border="1">
    </td>
    </tr>
   </table>

   <table height="50" width="50" border="1">
    <tr>
    <td>
      <img id="img-4" src="$squareBlue" height="100%" align="LEFT" border="1">
    </td>
    </tr>
   </table>

   <table height="50" width="50" border="1">
    <tr>
    <td>
      <img id="img-5" src="$squareBlue" width="100%" height="100%" align="LEFT" border="1">
    </td>
    </tr>
   </table>
''';


String getComputedStyleForElement(element, cssPropertyName) {
    Expect.isNotNull(element, "element");
    String propertyName=cssPropertyName.replaceAll("([A-Z])", r"-$1").toLowerCase();
    return element.getComputedStyle('').getPropertyValue(propertyName);
}

String getWidth(id) {
    Element element=document.getElementById(id);
    return getComputedStyleForElement(element, 'width');
}

String getHeight(id) {
    Element element=document.getElementById(id);
    return getComputedStyleForElement(element, 'height');
}


void doTest(e) {
    shouldBe(getWidth('img-1'), '105px', "getWidth('img-1')");
    shouldBe(getHeight('img-1'), '105px', "getHeight('img-1')");
    shouldBe(getWidth('img-2'), '98px', "getWidth('img-2')");
    shouldBe(getHeight('img-2'), '98px', "getHeight('img-2')");
    shouldBe(getWidth('img-3'), '40px', "getWidth('img-3')");
    shouldBe(getHeight('img-3'), '40px', "getHeight('img-3')");
    shouldBe(getWidth('img-4'), '36px', "getWidth('img-4')");
    shouldBe(getHeight('img-4'), '36px', "getHeight('img-4')");
    shouldBe(getWidth('img-5'), '40px', "getWidth('img-5')");
    shouldBe(getHeight('img-5'), '36px', "getHeight('img-5')");

    asyncEnd();
    checkTestFailures();
}

void main() {
    description("This test checks that a replaced element with percentage width (and no height specified) within a table cell is squeezed to the dimensions of the table cell.<br>See bug #29447.");
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onLoad.listen(doTest);
}
