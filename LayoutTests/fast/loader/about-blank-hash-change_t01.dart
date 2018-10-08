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
import "../../testharness.dart";

const String htmlEL2 = r'''
<p>This test tests parsing of hash fragments in about:blank URLs. Chromium had
a bug at one point where setting the hash fragment would cause a load event
and in some cases an infinite loop.</p>

<p>See <a href="https://bugs.webkit.org/show_bug.cgi?id=35180">
https://bugs.webkit.org/show_bug.cgi?id=35180</a>.</p>

<p>If the text says "PASS" then the onload() event only fired once. If it
says "FAIL" then it fired two or more times. Also, the test may time out
looping on this event handler (which is also a failure).
If the text says "No callback" then something else is broken :)
</p>
<div id="content">No callback</div>
<iframe name=inner id=inner style="display: none" src="about:blank"></iframe>
''';

int count = 0;

void onload_callback(e) {
    var inner = document.getElementById("inner") as IFrameElement;
    var old_hash = (inner.contentWindow.location as Location).hash;
    (inner.contentWindow.location as Location).hash = "hash-ref";
    var c = document.getElementById("content");
    count++;
    if (count == 1) {
        c.innerHtml = "PASS";
        asyncEnd();
    } else if (count >= 2) {
        c.innerHtml = "FAIL";
        Expect.fail("onload_callback invoked $count times");
    }
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    document.getElementById("inner").onLoad.listen(onload_callback);
 }
