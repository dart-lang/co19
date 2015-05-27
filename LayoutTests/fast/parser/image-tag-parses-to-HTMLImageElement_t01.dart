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
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
        <image id="image"/>
        <p>This tests that the parser parses 'image' as img and constructs a ImageElement.</p>
        <p id="result">TEST NOT RUN</p>
''';

void runTest(e) {
    var result = "TEST FAILED";
    var image = document.getElementById("image");
    Expect.isNotNull(image);
    Expect.equals("IMG", image.tagName);
    Expect.isTrue(image is ImageElement);
    document.getElementById("result").innerHtml = "TEST PASSED";
}

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(runTest);
}
