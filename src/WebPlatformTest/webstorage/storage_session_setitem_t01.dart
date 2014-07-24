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
        assert_throws("", () {
            sessionStorage["age"] = null;
        });
    }, "age null");
    test(() {
        sessionStorage["age"] = "null";
        assert_equals(sessionStorage.length, 2, "sessionStorage.length");
        assert_equals(sessionStorage["age"], "null");
    }, 'age "null"');
    test(() {
        assert_throws("", () {
            sessionStorage[null]="test";
        });
    }, 'null test');
    checkTestFailures();
}