/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

int testcount=0;

bool canFind(target, specimen) {
    window.getSelection().empty();
//    document.body.innerHTML = specimen;
    var textNode = new Text(specimen);
    document.body.append(textNode);
    document.execCommand("FindString", false, target);
    bool result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    textNode.remove();
    return result;
}

void runTests(e) {
    var nbsp = new String.fromCharCode(0xA0);
    shouldBeTrue(canFind("", "a b"), "Was able to find the empty string.");
    shouldBeTrue(canFind(" ", "a b"), "Cannot find space.");
    shouldBeFalse(canFind("  ", "a  b"), "Two spaces are matching even though they should be collapsed.");
    shouldBeTrue(canFind("  ", "<pre>a  b</pre>"), "Cannot find two spaces in a &lt;pre&gt; element.");
    shouldBeTrue(canFind(" ", "a&nbsp;b"), "Cannot find an &amp;nbsp; when searching for a space.");
    shouldBeTrue(canFind("  ", "a &nbsp;b"), "Cannot find a space followed by &amp;nbsp; when searching for two spaces.");
    shouldBeTrue(canFind("  ", "a&nbsp; b"), "Cannot find an &amp;nbsp; followed by a space when searching for two spaces.");
    shouldBeTrue(canFind(nbsp, "a b"), "Cannot find space.");
    shouldBeFalse(canFind(nbsp + nbsp, "a  b"), "Two spaces are matching even though they should be collapsed.");
    shouldBeTrue(canFind(nbsp + nbsp, "<pre>a  b</pre>"), "Cannot find two spaces in a &lt;pre&gt; element.");
    shouldBeTrue(canFind(nbsp, "a&nbsp;b"), "Cannot find an &amp;nbsp; when searching for a space.");
    shouldBeTrue(canFind(nbsp + nbsp, "a &nbsp;b"), "Cannot find a space followed by &amp;nbsp; when searching for two spaces.");
    shouldBeTrue(canFind(nbsp + nbsp, "a&nbsp; b"), "Cannot find an &amp;nbsp; followed by a space when searching for two spaces.");

    checkTestFailures();
}

void main() {
    window.onLoad.listen(runTests);
}
