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
<p>The following is a test for parsing ruby &lt;rp&gt; and &lt;rt&gt; elements. According to HTML5 spec, end-tags for both are optional if followed by another &lt;rp&gt; or &lt;rt&gt;. However, they should NOT be auto-closed by other inline elements, such as &lt;span&gt;.</p>
<p id="result">TEST DID NOT RUN</p>
Before <ruby id="ruby">base/<rp><span>left</span> rp/<rt>text/<rp>right <span>rp</span></ruby> After
''';

void test(e) {
    var markup = document.getElementById("ruby").outerHtml;
    document.getElementById("result").innerHtml = "TEST FAILED: Markup was $markup";
    Expect.equals('<ruby id="ruby">base/<rp><span>left</span> rp/</rp><rt>text/</rt><rp>right <span>rp</span></rp></ruby>', markup);
    document.getElementById("result").innerHtml = "TEST PASSED: Markup was correct";
}

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(test);
}
