/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for Buzilla Bug 15359: JPEG image not shown when height is
 * specified as percentage inside a table
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<table><tr><td><canvas id="canvas-75" style="background-color: #00ff00; height: 75%;"></canvas></td></tr></table>
<table><tr><td><canvas id="canvas-100" style="background-color: #00ff00; height: 100%;"></canvas></td></tr></table>

<table><tr><td><embed id="embed-75" style="background-color: #00ff00; height: 75%;"></embed></td></tr></table>
<table><tr><td><embed id="embed-100" style="background-color: #00ff00; height: 100%;"></embed></td></tr></table>

<table><tr><td><img id="img-75" src="resources/square-blue-100x100.png" style="height: 75%;"></td></tr></table>
<table><tr><td><img id="img-100" src="resources/square-blue-100x100.png" style="height: 100%;"></td></tr></table>

<table><tr><td><div><img id="img-75-nested" src="resources/square-blue-100x100.png" style="height: 75%;"></div></td></tr></table>
<table><tr><td><div><img id="img-100-nested" src="resources/square-blue-100x100.png" style="height: 100%;"></div></td></tr></table>

<table><tr><td><object id="object-75" style="background-color: #00ff00; height: 75%;"></object></td></tr></table>
<table><tr><td><object id="object-100" style="background-color: #00ff00; height: 100%;"></object></td></tr></table>

<table><tr><td><button id="button-75" style="height: 75%;">Button</button></td></tr></table>
<table><tr><td><button id="button-100" style="height: 100%;">Button</button></td></tr></table>

<table><tr><td><input type="button" id="input-button-75" style="height: 75%;" value="Input"></td></tr></table>
<table><tr><td><input type="button" id="input-button-100" style="height: 100%;" value="Input"></td></tr></table>

<table><tr><td><input type="checkbox" id="input-checkbox-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="checkbox" id="input-checkbox-100" style="height: 100%;"></td></tr></table>

<table><tr><td><input type="file" id="input-file-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="file" id="input-file-100" style="height: 100%;"></td></tr></table>

<table><tr><td><input type="image" src="resources/square-blue-100x100.png" id="input-image-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="image" src="resources/square-blue-100x100.png" id="input-image-100" style="height: 100%;"></td></tr></table>

<table><tr><td><input type="radio" id="input-radio-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="radio" id="input-radio-100" style="height: 100%;"></td></tr></table>

<table><tr><td><input type="reset" id="input-reset-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="reset" id="input-reset-100" style="height: 100%;"></td></tr></table>

<table><tr><td><input type="submit" id="input-submit-75" style="height: 75%;"></td></tr></table>
<table><tr><td><input type="submit" id="input-submit-100" style="height: 100%;"></td></tr></table>

<table><tr><td><select id="select-75" style="height: 75%;"><option>Option</option></select></td></tr></table>
<table><tr><td><select id="select-100" style="height: 100%;"><option>Option</option></select></td></tr></table>

<p id="description"></p>
<div id="console"></div>
''';

String getComputedStyleForElement(element, cssPropertyName) {
    Expect.isNotNull(element, "element");
    String propertyName=cssPropertyName.replaceAll("([A-Z])", r"-$1").toLowerCase();
    return element.getComputedStyle('').getPropertyValue(propertyName);
}

double parsePixelValue(String str) {
    Expect.isNotNull(str, "str=$str");
    Expect.isTrue(str.length >= 3, "str.length=${str.length}");
    Expect.isTrue(str.substring(str.length - 2) == "px", "str=$str");
    return double.parse(str.substring(0, str.length - 2));
}

String getHeight(id) {
    Element element=document.getElementById(id);
    return getComputedStyleForElement(element, 'height');
}

String getWidth(id) {
    Element element=document.getElementById(id);
    return getComputedStyleForElement(element, 'width');
}

void is75PercentOf(String str75, String str100, [String testName]) {
    double num75 = parsePixelValue(str75);
    double num100 = parsePixelValue(str100);

    if (num75 < 0 || num100 < 0)
        return;
    double expectedValue = num100 * 75 / 100;
    if ((num75 - expectedValue).abs() < 0.001)
        testPassed(testName);
    else
        testFailed(testName, "$str75 is not 75% of $str100");
}

void doTest(e) {

    shouldBe(getWidth('canvas-75'), '225px', "getWidth('canvas-75')");
    shouldBe(getHeight('canvas-75'), '112.5px', "getHeight('canvas-75')");
    shouldBe(getWidth('canvas-100'), '300px', "getWidth('canvas-100')");
    shouldBe(getHeight('canvas-100'), '150px', "getHeight('canvas-100')");

    shouldBe(getWidth('embed-75'), '300px', "getWidth('embed-75')");
    shouldBe(getHeight('embed-75'), '112.5px', "getHeight('embed-75')");
    shouldBe(getWidth('embed-100'), '300px', "getWidth('embed-100')");
    shouldBe(getHeight('embed-100'), '150px', "getHeight('embed-100')");

    shouldBe(getWidth('img-75'), '75px', "getWidth('img-75')");
    shouldBe(getHeight('img-75'), '75px', "getHeight('img-75')");
    shouldBe(getWidth('img-100'), '100px', "getWidth('img-100')");
    shouldBe(getHeight('img-100'), '100px', "getHeight('img-100')");

    shouldBe(getWidth('img-75-nested'), '75px', "getWidth('img-75-nested')");
    shouldBe(getHeight('img-75-nested'), '75px', "getHeight('img-75-nested')");
    shouldBe(getWidth('img-100-nested'), '100px', "getWidth('img-100-nested')");
    shouldBe(getHeight('img-100-nested'), '100px', "getHeight('img-100-nested')");

    shouldBe(getWidth('object-75'), '300px', "getWidth('object-75')");
    shouldBe(getHeight('object-75'), '112.5px', "getHeight('object-75')");
    shouldBe(getWidth('object-100'), '300px', "getWidth('object-100')");
    shouldBe(getHeight('object-100'), '150px', "getHeight('object-100')");

    shouldBe(getWidth('button-75'), getWidth('button-100'), "getWidth('button-75'), getWidth('button-100')");
    shouldBeTrue(getHeight('button-75') != '0px', "getHeight('button-75') != '0px'");
    shouldBe(getHeight('button-75'), getHeight('button-100'), "getHeight('button-75'), getHeight('button-100')");

    shouldBe(getWidth('input-button-75'), getWidth('input-button-100'), "getWidth('input-button-75'), getWidth('input-button-100')");
    shouldBeTrue(getHeight('input-button-75') != '0px', "getHeight('input-button-75') != '0px'");
    shouldBe(getHeight('input-button-75'), getHeight('input-button-100'), "getHeight('input-button-75'), getHeight('input-button-100')");

    shouldBe(getWidth('input-checkbox-75'), getWidth('input-checkbox-100'), "getWidth('input-checkbox-75'), getWidth('input-checkbox-100')");
    shouldBeTrue(getHeight('input-checkbox-75') != '0px', "getHeight('input-checkbox-75') != '0px'");
    // Note: This behavior doesn't match to Firefox 3.5 and Opera 10.
    is75PercentOf(getHeight('input-checkbox-75'), getHeight('input-checkbox-100'), 'is75PercentOf:input-checkbox-75');

    shouldBe(getWidth('input-file-75'), getWidth('input-file-100'), "getWidth('input-file-75'), getWidth('input-file-100')");
    shouldBeTrue(getHeight('input-file-75') != '0px', "getHeight('input-file-75') != '0px'");
    // Note: This behavior doesn't match to Firefox 3.5 and Opera 10.
    is75PercentOf(getHeight('input-file-75'), getHeight('input-file-100'), 'is75PercentOf:input-file-75');

    // Note: This behavior doesn't match to Firefox 3.5 and Opera 10.
    shouldBe(getWidth('input-image-75'), '75px', "getWidth('input-image-75')");
    shouldBe(getHeight('input-image-75'), '75px', "getHeight('input-image-75')");
    shouldBe(getWidth('input-image-100'), '100px', "getWidth('input-image-100')");
    shouldBe(getHeight('input-image-100'), '100px', "getHeight('input-image-100')");

    shouldBe(getWidth('input-radio-75'), getWidth('input-radio-100'), "getWidth('input-radio-75'), getWidth('input-radio-100')");
    shouldBeTrue(getHeight('input-radio-75') != '0px', "getHeight('input-radio-75') != '0px'");
    // Note: This behavior doesn't match to Firefox 3.5 and Opera 10.
    is75PercentOf(getHeight('input-radio-75'), getHeight('input-radio-100'), 'is75PercentOf:input-radio-75');

    shouldBe(getWidth('input-reset-75'), getWidth('input-reset-100'), "getWidth('input-reset-75'), getWidth('input-reset-100')");
    shouldBeTrue(getHeight('input-reset-75') != '0px', "getHeight('input-reset-75') != '0px'");
    shouldBe(getHeight('input-reset-75'), getHeight('input-reset-100'), "getHeight('input-reset-75'), getHeight('input-reset-100')");

    shouldBe(getWidth('input-submit-75'), getWidth('input-submit-100'), "getWidth('input-submit-75'), getWidth('input-submit-100')");
    shouldBeTrue(getHeight('input-submit-75') != '0px', "getHeight('input-submit-75') != '0px'");
    shouldBe(getHeight('input-submit-75'), getHeight('input-submit-100'), "getHeight('input-submit-75'), getHeight('input-submit-100')");

    shouldBe(getWidth('select-75'), getWidth('select-100'), "getWidth('select-75'), getWidth('select-100')");
    shouldBeTrue(getHeight('select-75') != '0px', "getHeight('select-75') != '0px'");
    shouldBe(getHeight('select-75'), getHeight('select-100'), "getHeight('select-75'), getHeight('select-100')");

    asyncEnd();
    checkTestFailures();
}

void main() {
    description("This test checks that replaced elements with percentage heights within table cells have the correct height.<br>Note, some of the button height tests fail on the Windows ports. See bug #34071.");
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onLoad.listen(doTest);
}
