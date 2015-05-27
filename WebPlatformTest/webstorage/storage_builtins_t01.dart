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
 * after web-platform-tests/webstorage/storage_local_builtins.html
 *   and web-platform-tests/webstorage/storage_session_builtins.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description Web Storage
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void test_storage_builtins(aStorage, diag) {
    test(() {
        aStorage.clear();
        assert_equals(aStorage.length, 0, "aStorage.length");

        var builtins = ["key", "getItem", "setItem", "removeItem", "clear"];
        builtins.forEach((b) { aStorage[b] = b; });
        var actual=builtins.map((b) { return aStorage[b]; });
        assert_array_equals(actual.toList(), builtins, "c");

        assert_equals(aStorage.length, builtins.length, "aStorage.length");
    }, diag);
}

void main() {
    test_storage_builtins(window.localStorage, "localStorage");
    test_storage_builtins(window.sessionStorage, "sessionStorage");
    checkTestFailures();
}
