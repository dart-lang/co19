/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests find for strings with soft hyphens in them.
 */
import "dart:html";
import "../../testharness.dart";

int testcount=0;

void shouldBeCanFind(String target, String specimen, bool isExpectedToFind) {
    testcount++;
    window.getSelection().empty();
    var textNode = new Text(specimen);
    document.body.append(textNode);
    document.execCommand("FindString", false, target);
    var result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    textNode.remove();
    String testName="(target=$target, specimen=$specimen, expected=$isExpectedToFind)";
    if (result == isExpectedToFind) {
        testPassed(testName);
    } else {
        testFailed(testName, "test no $testcount");
    }
}

void main() {
    
    var hyphen= new String.fromCharCode(0x2010);
    var softHyphen = new String.fromCharCode(0x00AD);
    
    shouldBeCanFind("ab", "a" + softHyphen + "b", true);
    shouldBeCanFind("ab", "a" + softHyphen + softHyphen + "b", true);
    shouldBeCanFind("a\u0300b", "a" + softHyphen + "b", true);
    shouldBeCanFind("ab", "a" + softHyphen + "\u0300b", true);
    shouldBeCanFind("ab", "a\u0300" + softHyphen + "b", true);
    shouldBeCanFind("a" + softHyphen + "b", "a" + softHyphen + "b", true);
    shouldBeCanFind("a" + softHyphen + "b", "ab", true);
    
    // Soft hyphen doesn't match hyphen and hyphen-minus.
    shouldBeCanFind("a" + hyphen + "b", "a" + softHyphen + "b", false);
    shouldBeCanFind("a-b", "a" + softHyphen + "b", false);

    checkTestFailures();
}
