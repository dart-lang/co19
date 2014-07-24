/**
 * after web-platform-tests/webstorage/storage_session_length_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage sessionStorage=window.sessionStorage;
    sessionStorage.clear();
    assert_equals(sessionStorage.length, 0, "sessionStorage.length");

    sessionStorage["name"] = "user1";
    sessionStorage["age"] = "20";

    assert_equals(sessionStorage.length, 2, "sessionStorage.length");
}
