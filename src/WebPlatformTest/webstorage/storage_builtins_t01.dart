/**
 * after web-platform-tests/webstorage/storage_local_builtins.html
 *   and web-platform-tests/webstorage/storage_session_builtins.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description Web Storage
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void test_storage_builtins(aStorage) {
    test(() {
        aStorage.clear();
        assert_equals(aStorage.length, 0, "aStorage.length");

        var builtins = ["key", "getItem", "setItem", "removeItem", "clear"];
        var origBuiltins = builtins.map(function(b) { return Storage.prototype[b]; });
        assert_array_equals(builtins.map(function(b) { return aStorage[b]; }), origBuiltins, "a");
        builtins.forEach(function(b) { aStorage[b] = b; });
        assert_array_equals(builtins.map(function(b) { return aStorage[b]; }), origBuiltins, "b");
        assert_array_equals(builtins.map(function(b) { return aStorage.getItem(b); }), builtins, "c");

        assert_equals(aStorage.length, builtins.length, "aStorage.length");
    });
}

void main() {
    test_storage_builtins(window.localStorage);
    test_storage_builtins(window.sessionStorage);}
    checkTestFailures();
}
