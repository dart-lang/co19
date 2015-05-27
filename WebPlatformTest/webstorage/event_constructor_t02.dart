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
 * after web-platform-tests/webstorage/event_constructor_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description StorageEvent constructor and nulls 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    void onStorageEvent(event) {
        assert_equals(event.type, 'storage', 'type');
        assert_equals(event.key, null, 'key');
        assert_equals(event.oldValue, null, 'oldValue');
        assert_equals(event.newValue, null, 'newValue');
        assert_equals(event.url, 'null', 'url');
        assert_equals(event.storageArea, null, 'storageArea');
        asyncEnd();
    }

    window.addEventListener('storage', onStorageEvent, false);
    var event = new StorageEvent('storage', 
        key: null,
        oldValue: null,
        newValue: null,
        url: null
    );
    asyncStart();
    window.dispatchEvent(event);
}
