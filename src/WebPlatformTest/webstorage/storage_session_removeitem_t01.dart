/**
 * after web-platform-tests/webstorage/storage_session_removeitem_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage sessionStorage=window.sessionStorage;
    sessionStorage.clear();

    test(() {
        sessionStorage["null"]="test";
        assert_equals(sessionStorage["null"], "test");
        sessionStorage.remove("null");
        assert_equals(sessionStorage["null"], null);
    }, "removed item should be null");
  
    checkTestFailures();
}
