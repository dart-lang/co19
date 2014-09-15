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
