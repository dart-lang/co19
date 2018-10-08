/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for Bug 33533: window.onload never fires if page contains
 * an &lt;iframe> with a bad scheme or whose load is cancelled by returning
 * null from resource load delegate's willSendRequest.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>Test for <a href="http://webkit.org/b/33533">window.onload never fires if page contains an
&lt;iframe> with a bad scheme or whose load is cancelled by returning null from resource load
delegate's willSendRequest</a>. If the test passes, you should see the word "PASSED" below.</p>
<div id=result>FAILED</div>
<iframe src="http://www.example.com/"></iframe>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    window.onLoad.listen((e) {
        asyncEnd();
        var result = document.getElementById("result");
        result.text = "PASSED";
    });

}
