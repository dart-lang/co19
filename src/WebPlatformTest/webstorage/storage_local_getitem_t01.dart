/**
 * after web-platform-tests/webstorage/storage_local_getitem_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
  Storage localStorage=window.localStorage;
  localStorage.clear();
  localStorage["undefined"]="foo";
  localStorage["null"]="bar";
  localStorage[""]="baz";
  test(() {
      assert_equals(localStorage.length, 3);
  }, "All 3 items should be added.");
  
  test(() {
      assert_equals(localStorage["unknown"], null, "localStorage['unknown']");
      assert_equals(localStorage["undefined"], "foo", "localStorage['undefined']");
      assert_equals(localStorage["null"], "bar", "localStorage['null']");
      assert_equals(localStorage[""], "baz", "localStorage['']");
  }, "array access should be correct");
  
    checkTestFailures();
}
