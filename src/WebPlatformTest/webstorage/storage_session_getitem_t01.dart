/**
 * after web-platform-tests/webstorage/storage_session_getitem_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Storage sessionStorage=window.sessionStorage;

    sessionStorage.clear();
    sessionStorage["undefined"]="foo";
    sessionStorage["null"]="bar";
    sessionStorage[""]="baz";
    test(() {
        assert_equals(sessionStorage.length, 3);
    }, "All 3 items should be added.");

    test(() {
        assert_equals(sessionStorage["unknown"], null, "sessionStorage['unknown']");
        assert_equals(sessionStorage["undefined"], "foo", "sessionStorage['undefined']");
        assert_equals(sessionStorage["null"], "bar", "sessionStorage['null']");
        assert_equals(sessionStorage[""], "baz", "sessionStorage['']");
    }, "array access should be correct");

    checkTestFailures();
}