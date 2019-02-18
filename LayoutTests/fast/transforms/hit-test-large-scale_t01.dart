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
import "../../../Utils/expect.dart";

const String htmlEL1 = r'''
<style type="text/css">
    #progress {
        width: 2px;
        height: 2px;
        margin: 10px;
        -webkit-transform: scale(60);
        -webkit-transform-origin: 0 0;
        background-color: blue;
    }

    #progress:hover {
        background-color: red;
    }
</style>
''';

const String htmlEL2 = r'''
    <p>The blue box only responds to hover over some of its area. It has a scale() transform</p>
    <div id="progress"></div>

    <div id="console"></div>
''';

void runTest(e) {
    document.body.offsetWidth;
    var elt = document.elementFromPoint(130, 130);
    Expect. equals(document.getElementById('progress'), elt);
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    tc.addOnLoadListener((_) {
      runTest(_);
    });
}
