/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 * @needsreview dart issue #21371
 */
import "dart:html";
import "../../../testharness.dart";

const String htmlEL2 = r'''
<p>
This test calls replaceState during the onload handler to verify that the correct document's state is modified.
If the test succeeds the URL and text below will show a success message.
</p>
<pre id="logger"></pre>
''';

void onload (e) {
    String search= window.location.search;
    if (search==null || search=="") {
        window.onUnload.listen((e) { window.history.replaceState({}, '', '?FAIL'); });
        window.location = window.location.href + "?PASS";
    } else {
        document.getElementById("logger").text = window.location.search.substring(1);
    }
}

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    window.onLoad.listen(onload);
}
