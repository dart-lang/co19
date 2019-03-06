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
import "../../testcommon.dart" as tc;
import "../../testharness.dart";

var apostrophe = "'";
var hebrewPunctuationGeresh = new String.fromCharCode(0x05F3);
var hebrewPunctuationGershayim = new String.fromCharCode(0x05F4);
var leftDoubleQuotationMark = new String.fromCharCode(0x201C);
var leftSingleQuotationMark = new String.fromCharCode(0x2018);
var quotationMark = '"';
var rightDoubleQuotationMark = new String.fromCharCode(0x201D);
var rightSingleQuotationMark = new String.fromCharCode(0x2019);

bool canFind(target, specimen) {
    window.getSelection().empty();
    document.body.setInnerHtml(specimen);
    document.execCommand("FindString", false, target);
    bool result = window.getSelection().rangeCount != 0;
    window.getSelection().empty();
    return result;
}

void testFindExpectingSuccess(target, specimen) {
    shouldBeTrue(canFind(target, specimen), "Cannot find $specimen when searching for $target .");
}

void testFindExpectingFailure(target, specimen) {
    shouldBeFalse(canFind(target, specimen), "Found $specimen when searching for $target.");
}

void runTests(e) {
    var singleQuotes = [apostrophe, hebrewPunctuationGeresh, leftSingleQuotationMark, rightSingleQuotationMark];
    var doubleQuotes = [quotationMark, hebrewPunctuationGershayim, leftDoubleQuotationMark, rightDoubleQuotationMark];

    for (var i = 0; i < singleQuotes.length; ++i) {
        for (var j = 0; j < singleQuotes.length; ++j)
            testFindExpectingSuccess(singleQuotes[i], singleQuotes[j]);
    }

    for (var i = 0; i < doubleQuotes.length; ++i) {
        for (var j = 0; j < doubleQuotes.length; ++j)
            testFindExpectingSuccess(doubleQuotes[i], doubleQuotes[j]);
    }

    for (var i = 0; i < singleQuotes.length; ++i) {
        for (var j = 0; j < doubleQuotes.length; ++j)
            testFindExpectingFailure(singleQuotes[i], doubleQuotes[j]);
    }

    for (var i = 0; i < doubleQuotes.length; ++i) {
        for (var j = 0; j < singleQuotes.length; ++j)
            testFindExpectingFailure(doubleQuotes[i], singleQuotes[j]);
    }
 
    checkTestFailures();
}

void main() {
    tc.addOnLoadListener(runTests);
}
