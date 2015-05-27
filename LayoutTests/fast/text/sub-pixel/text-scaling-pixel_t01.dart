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
import "../../../../Utils/expect.dart";
import "../../../testharness.dart";

import "resources/text-scaling.dart";

const String htmlEL1 = '''
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="$testSuiteRoot/fast/text/sub-pixel/resources/text-scaling.css">
<style>
    body { overflow: hidden; }
</style>
''';

const String htmlEL2 = r'''
<section>
    <h1>Font Size Scaling Pixel Test</h1>
    <p>
        Size of the text should scale smoothly.
        Reported width should be within 0.01px of that of the highlighted reference row.
    </p>
    <div id="test"></div>
</section>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    var PANGRAM = 'Amazingly few discotheques provide jukeboxes.';
    int failures = runTest(document.getElementById('test'), PANGRAM);
    Expect.equals(0, failures,
       'Size of text does not scale smoothly, reported widths highlighted in red do not match reference row.');
    // Hide text if test passes as the actual numbers are
    // different across platforms and would require platform
    // specific baselines.
    print("test passed");
}
