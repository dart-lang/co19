/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This tests that storage methods throw exceptions with reasonable messages inside 'data:' URLs.
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
    <iframe src="data:text/html,<script>try { window.localStorage; } catch(e) { window.top.postMessage(e.message, '*'); }; try { window.sessionStorage; } catch(e) { window.top.postMessage(e.message, '*'); }</script>"></iframe>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());

    var errorsSeen = 0;
    var exceptionMessage;
    asyncStart();
    window.addEventListener('message', (Event e) {
        errorsSeen++;
        exceptionMessage =  (e as dynamic).data;
//        print("exceptionMessage=$exceptionMessage;");
        if (errorsSeen == 1) {
            Expect.equals("Failed to read the 'localStorage' property from 'Window': Storage is disabled inside 'data:' URLs.", exceptionMessage);
        } else {
            Expect.equals("Failed to read the 'sessionStorage' property from 'Window': Storage is disabled inside 'data:' URLs.", exceptionMessage);
            asyncEnd();
        }
    });
}
