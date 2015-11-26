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
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
<p>This test tests parsing of hash fragments in about:blank URLs
(they should be preserved).</p>
<p>See <a href="https://bugs.webkit.org/show_bug.cgi?id=35399">
https://bugs.webkit.org/show_bug.cgi?id=35399</a>.</p>
<div id="content">No callback</div>
<iframe name=inner id=inner style="display: none" src="about:blank"></iframe>
''';
//<iframe style="display:none" name=inner id=inner" src="about:blank"></iframe>

void onload_callback(e) {
    var inner = document.getElementById("inner");
    var old_hash = inner.location.hash;
    inner.location.hash = "hash-ref";
    var c = document.getElementById("content");
    if (new_hash == "#hash-ref") {
        c.innerHtml = "PASS";
        asyncEnd();
    } else {
        c.innerHtml = "FAIL";
        Expect.fail("new_hash='$new_hash'");
    }
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    asyncStart();
    document.getElementById("inner").onLoad.listen(onload_callback);
}
