/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for embedded iframe with height: 100% and anonymous table cell parent.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style>
html, body {
    height: 100%;
}
</style>
''';

const String htmlEL2 = r'''
<p id="description"></p>
<div id="console"></div>

<div style="display:table; height: 100%;">
<div style="display:table-row; height: 100%;">
<iframe id="iframe-100" frameborder="0px" style="height: 100%;" src=""></iframe>
</div>
</div>
''';

String getComputedStyleForElement(element, cssPropertyName) {
    Expect.isNotNull(element, "element");
    String propertyName=cssPropertyName.replaceAll("([A-Z])", r"-$1").toLowerCase();
    return element.getComputedStyle('').getPropertyValue(propertyName);
}

int parsePixelValue(String str) {
    Expect.isNotNull(str, "str=$str");
    Expect.isTrue(str.length >= 3, "str.length=${str.length}");
    Expect.isTrue(str.substring(str.length - 2) == "px", "str=$str");
    return int.parse(str.substring(0, str.length - 2));
}

int getHeight(id) {
    Element element=document.getElementById(id);
    return parsePixelValue(getComputedStyleForElement(element, 'height'));
}

void doTest(e) {
    Expect.equals(window.innerHeight, getHeight('iframe-100'));
    asyncEnd();
}

void main() {
    description("This test checks that iframe with percentage height within anonymous table cell has the correct height (strict mode).");
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onLoad.listen(doTest);
}
