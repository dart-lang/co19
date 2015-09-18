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
 * after web-platform-tests/webstorage/storage_local_setitem_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/
 * @description
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage localStorage=window.localStorage;
    localStorage.clear();
    test(() {
        Expect.isNull(localStorage["name"]);
        Expect.isNull(localStorage["age"]);
    }, "localStorage is empty");
    test(() {
        localStorage["name"] = "user1";
        assert_equals(localStorage.length, 1, "localStorage.length");
        assert_equals(localStorage["name"], "user1");
    }, "name user1");
    test(() {
        localStorage["name"] = "user2";
        assert_equals(localStorage.length, 1, "localStorage.length");
        assert_equals(localStorage["name"], "user2");
    }, "name user2");
    test(() {
        localStorage["name"]="user3";
        assert_equals(localStorage.length, 1, "localStorage.length");
        assert_equals(localStorage["name"], "user3");
    }, "name user3");
    test(() {
        localStorage["age"] = "null";
        assert_equals(localStorage.length, 2, "localStorage.length");
        assert_equals(localStorage["age"], "null");
    }, 'age "null"');
    checkTestFailures();
}
