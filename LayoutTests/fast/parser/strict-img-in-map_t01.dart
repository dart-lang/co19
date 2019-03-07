/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Stray param elements are not dropped when parsing
 */
import "dart:html";
import "../../testcommon.dart" as tc;
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
        <map><img id="image" alt="x" height="10" width="10" border="1"></map>
        <p>This tests that images are allowed in map elements even in strict mode.</p>
        <p id="result">"TEST FAILED</p>
''';

void runTest(e) {
    Element image = document.getElementById("image");
    Expect.isNotNull(image, "image");
    Node parent = image.parentNode;
    Expect.isNotNull(parent, "parent");
    Expect.equals("MAP", (parent as Element).tagName);
    document.getElementById("result").innerHtml = "TEST PASSED";
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener(runTest);
}
