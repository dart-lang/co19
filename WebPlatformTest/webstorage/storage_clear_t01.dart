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
 * after web-platform-tests/webstorage/storage_local_clear.html
 *   and web-platform-tests/webstorage/storage_session_clear.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void test_storage(Storage aStorage, String diag) {
    test(() {
        aStorage.clear();
        aStorage["name"]="user1";

        assert_not_equals(aStorage["name"], null);
        assert_equals(aStorage.length, 1);

        aStorage.clear();
        assert_equals(aStorage["name"], null, "aStorage['name']");
        assert_equals(aStorage.length, 0, "aStorage.length");
    }, diag);
}

void main() {
    test_storage(window.localStorage, "localStorage");
    test_storage(window.sessionStorage, "sessionStorage");
    checkTestFailures();
}
