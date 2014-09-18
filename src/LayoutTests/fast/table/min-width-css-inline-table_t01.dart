/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This test checks that the min-width style is applied to block CSS tables.
 */
import "dart:html";
import "../../testharness.dart";
import "script-tests/min-width-helpers.dart";

const String htmlEL1 = '''
<link href="$testSuiteRoot/fast/table/resources/min-width.css" rel="stylesheet" type="text/css">
''';

const String htmlEL2 = r'''
<div id="console"></div>
''';

// Requires min-width-helpers.js.

String computeLogicalWidth(writingMode, direction, tableStyle) {
    return computeLogicalWidthHelper("css", "inline", writingMode, direction, tableStyle);
}

void main() {
    description("This test checks that the min-width style is applied to inline CSS tables.");
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
//    printPassed=true;
    runTests("css", computeLogicalWidth);
    checkTestFailures();
}
