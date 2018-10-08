/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for Buzilla Bug 15359: JPEG image not shown when height is specified as percentage inside a table
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<table><tr><td><input type="password" id="input-password-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="password" id="input-password-100" style="height: 100%;"></td></tr></table>

<table><tr><td><input type="text" id="input-text-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="text" id="input-text-100" style="height: 100%;"></td></tr></table>

<table><tr><td><textarea id="textarea-75" style="height: 75%;"></textarea></td></tr></table>
<table><tr><td><textarea id="textarea-100" style="height: 100%;"></textarea></td></tr></table>

<p id="description"></p>
''';

double parsePixelValue(String str) {
    Expect.isNotNull(str, "str=$str");
    Expect.isTrue(str.length >= 3, "str.length=${str.length}");
    Expect.isTrue(str.substring(str.length - 2) == "px", "str=$str");
    return double.parse(str.substring(0, str.length - 2));
}

double getComputedStyleForElement(element, cssPropertyName) {
    Expect.isNotNull(element, "element");
    String propertyName=cssPropertyName.replaceAll("([A-Z])", r"-$1").toLowerCase();
    String value = element.getComputedStyle('').getPropertyValue(propertyName);
    return parsePixelValue(value);
}

double getWidth(id) {
    Element element=document.getElementById(id);
    return getComputedStyleForElement(element, 'width');
}

double getFullHeight(String id) {
    Element element = document.getElementById(id);
    var h = getComputedStyleForElement(element, 'border-top-width')
      + getComputedStyleForElement(element, 'padding-top')
      + getComputedStyleForElement(element, 'height')
      + getComputedStyleForElement(element, 'padding-bottom')
      + getComputedStyleForElement(element, 'border-bottom-width');
    return h;
}

void is75PercentOf(double num75, double num100, [String testName]) {
    if (num75 < 0 || num100 < 0)
        return;
//    if (num75 == (num100 * 75 / 100).floor()) -- wrong
    double expectedValue = num100 * 75 / 100;
    if ((num75 - expectedValue).abs() < 0.001)
        testPassed(testName);
    else
        testFailed(testName, "$num75 is not 75% of $num100");
}

void doTest(e) {

    shouldBe(getWidth('input-password-75'), getWidth('input-password-100'), "'input-password-75'), getWidth('input-password-100')");
    shouldBeTrue(getFullHeight('input-password-75') != 0, "'input-password-75') != 0");
    // Note: This behavior doesn't match to IE 8, Firefox 3.5 and Opera 10.
    is75PercentOf(getFullHeight('input-password-75'), getFullHeight('input-password-100'), "getFullHeight('input-password-75'), getFullHeight('input-password-100')");
    shouldBe(getWidth('input-text-75'), getWidth('input-text-100'), "getWidth('input-text-75'), getWidth('input-text-100')");
    shouldBeTrue(getFullHeight('input-text-75') != 0, "getFullHeight('input-text-75') != 0");
    // Note: This behavior doesn't match to IE 8, Firefox 3.5 and Opera 10.
    is75PercentOf(getFullHeight('input-text-75'), getFullHeight('input-text-100'), "getFullHeight('input-text-75'), getFullHeight('input-text-100')");

    shouldBe(getWidth('textarea-75'), getWidth('textarea-100'), "getWidth('textarea-75'), getWidth('textarea-100')");
    shouldBeTrue(getFullHeight('textarea-75') != 0, "getFullHeight('textarea-75') != 0");
    // Note: This behavior doesn't match to IE 8, Firefox 3.5 and Opera 10.
    is75PercentOf(getFullHeight('textarea-75'), getFullHeight('textarea-100'), "getFullHeight('textarea-75'), getFullHeight('textarea-100')");

    asyncEnd();
    checkTestFailures();
}

void main() {
    description("This test checks that text controls with percentage heights within table cells have the correct height." +
        "Text controls are in a different test than other replaced elements because their metrics are platform-specific.");
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onLoad.listen(doTest);
}
