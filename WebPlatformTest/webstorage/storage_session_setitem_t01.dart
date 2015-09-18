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
 * after web-platform-tests/webstorage/storage_session_setitem_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/
 * @description
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage sessionStorage=window.sessionStorage;
    sessionStorage.clear();
    test(() {
        Expect.isNull(sessionStorage["name"]);
        Expect.isNull(sessionStorage["age"]);
    }, "sessionStorage is empty");
    test(() {
        sessionStorage["name"] = "user1";
        assert_equals(sessionStorage.length, 1, "sessionStorage.length");
        assert_equals(sessionStorage["name"], "user1");
    }, "name user1");
    test(() {
        sessionStorage["name"] = "user2";
        assert_equals(sessionStorage.length, 1, "sessionStorage.length");
        assert_equals(sessionStorage["name"], "user2");
    }, "name user2");
    test(() {
        sessionStorage["name"]="user3";
        assert_equals(sessionStorage.length, 1, "sessionStorage.length");
        assert_equals(sessionStorage["name"], "user3");
    }, "name user3");
    test(() {
        sessionStorage["age"] = "null";
        assert_equals(sessionStorage.length, 2, "sessionStorage.length");
        assert_equals(sessionStorage["age"], "null");
    }, 'age "null"');
    checkTestFailures();
}
