/**
 * after web-platform-tests/webstorage/storage_local_clear.html
 *   and web-platform-tests/webstorage/storage_session_clear.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void test_storage(Storage aStorage) {
    test(() {
        aStorage.clear();
        aStorage.setItem("name", "user1");

        assert_not_equals(aStorage.getItem("name"), null);
        assert_equals(aStorage.length, 1);

        aStorage.clear();
        assert_equals(aStorage.getItem("name"), null, "aStorage.getItem('name')")
        assert_equals(aStorage.length, 0, "aStorage.length")
    });
}

void main() {
    test_storage(window.localStorage);
    test_storage(window.sessionStorage);}
    checkTestFailures();
}
