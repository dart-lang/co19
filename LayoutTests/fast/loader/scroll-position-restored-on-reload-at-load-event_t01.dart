/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test ensures that documentElement.scrollTop/Left properties
 * are available by the time DOMContentLoaded event fires.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL1 = r'''
    <div style='width: 9999px; height:9999px; float:left;'></div>
''';

// Navigation steps:
// 1- page gets first loaded and scrolled.
// 2- reload is performed.
// Test: ensure that by the time DOMContenLoaded fires (after a reload navigation), documentElement.scrollTop/Left are set.

void init(evt) {
    if (window.name == 'second/load') {
        shouldBe(document.documentElement.scrollTop, 2000);
        shouldBe(document.documentElement.scrollLeft, 1000);
        checkTestFailures();
        window.name = "";
        asyncEnd();
    } else {
        window.scrollTo(1000, 2000);
        window.name = "second/load";
        runLater((){window.location.reload();}, 0);
    }
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.addEventListener('DOMContentLoaded', init, true);
    window.onUnload.listen((e) {});  // prevent caching
}
