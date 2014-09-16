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
 * after web-platform-tests/webstorage/storage_local_setitem_quotaexceedederr.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description storage_local_setItem_QUOTA_EXCEEDED_ERR
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage storage=window.localStorage;
    storage.clear();

    var index = 0;
    var key = "name";
    var val = "user";

    assert_throws("QuotaExceededError", () {
        while (true) {
            index++;
            storage["${key}${index}"]="${val}${index}";
        }
    });

    storage.clear();
}
