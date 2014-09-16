/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/webstorage/event_local_url.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description url property test of local event
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

String path='${testSuiteRoot}/webstorage/iframe/local_set_item_iframe.html';

void main() {
    void onStorageEvent(event) {
        Expect.isTrue(event.url.endsWith(path), path); // TODO extract path from url and compare exactly
        asyncEnd();
    }

    window.localStorage.clear();
    window.addEventListener('storage', onStorageEvent, false);
    asyncStart();
    var el = document.createElement("iframe");
    el.setAttribute('id', 'ifrm');
    el.setAttribute('src', path);
    document.body.append(el);
}
