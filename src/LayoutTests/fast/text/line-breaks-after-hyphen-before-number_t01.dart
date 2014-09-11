/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Line breaks after hyphen before number
 */
import "../../testharness.dart";

const String htmlEL1 = '''
<style>
.test { width: 1px; }
</style>
''';

var tests = [
    r"$-1111111",
    "-2222.2222",
    "-.33333333",
    "4444444-4444444",
    "5555555-abcdefg",
    "abcdefg-6666666"
];

// Each of the above tests should look like corresponding expectation below.
var expected = [
    r"$-1111111",
    "-2222.2222",
    "-.33333333",
    "4444444-<br>4444444",
    "5555555-<br>abcdefg",
    "abcdefg-<br>6666666"
];

void main() {
    document.head.appendHtml(htmlEL1);

    for (int i = 1; i <= tests.length; ++i) {
        document.body.appendHtml("""
            <br>
            Test $i:
            <div class='test' id='test$i'>${tests[i - 1]}</div>
            Expected:
            <div id='expected$i'>${expected[i - 1]}</div>
        """);
        shouldBe(document.getElementById("test$i").getComputedStyle().height,
                 document.getElementById("expected$i").getComputedStyle().height,
                 "no. $i");
    }
    
    checkTestFailures();
}