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
        assert_throws("", () {
            localStorage["age"] = null;
        });
    }, "age null");
    test(() {
        localStorage["age"] = "null";
        assert_equals(localStorage.length, 2, "localStorage.length");
        assert_equals(localStorage["age"], "null");
    }, 'age "null"');
    test(() {
        assert_throws("", () {
            localStorage[null]="test";
        });
    }, 'null test');
    checkTestFailures();
}
    