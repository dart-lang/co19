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

const String htmlEL2 = r'''
        <div id="table" style="display: table;">
            <em id="em"></em>
            <audio controls="arbitrary" style="display: table-caption;" />
            <img id="img" />
        </div>
        <div id="result"></div>
''';

void runTest(e) {
    var img = document.getElementById('img');
    var em = document.getElementById('em');
    em.replaceWith(img);
    document.body.offsetTop;
    document.getElementById('table').remove();

    document.getElementById("result").innerHtml = "PASS";
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener((_) {
      runTest(_);
    });
}