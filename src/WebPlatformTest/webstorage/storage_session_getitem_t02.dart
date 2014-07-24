/**
 * after web-platform-tests/webstorage/storage_session_getitem.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage sessionStorage=window.sessionStorage;

    sessionStorage.clear();
    sessionStorage["name"]="user1";
    sessionStorage["age"]="20";

    test(() {
        assert_equals(sessionStorage["name"], "user1", "sessionStorage.getItem('name')");
        assert_equals(sessionStorage["unknown"], null, "sessionStorage.getItem('unknown')");
    }, "getItem method test");

    checkTestFailures();
}
