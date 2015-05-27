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
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>The following is a real-world example of use of the wbr element. This test checks that we parse it properly.</p>
<p id="result">TEST DID NOT RUN</p>
<a id="specimen" href="http://groups.yahoo.com/group/BATN/message/34500">http://groups.<wbr>yahoo.com/<wbr>group/BATN/<wbr>message/34500</a>
''';

const String wbrRef=
    '<a id="specimen" href="http://groups.yahoo.com/group/BATN/message/34500">http://groups.<wbr>yahoo.com/<wbr>group/BATN/<wbr>message/34500</a>';

void runTest(e) {
    var markup = document.getElementById("specimen").outerHtml;
    Expect.equals(wbrRef, markup);
    (document.getElementById("result").firstChild as Text).data = "TEST PASSED: Markup was correct";
}

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(runTest);
}
