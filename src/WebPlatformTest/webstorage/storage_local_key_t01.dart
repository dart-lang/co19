/**
 * after web-platform-tests/webstorage/storage_local_key.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
  Storage localStorage=window.localStorage;
  localStorage.clear();

  localStorage["name"]="user1";
  localStorage["age"]="20";
  localStorage["a"]="1";
  localStorage["b"]="2";

  var keys = ["name", "age", "a", "b"];
  for (var i = 0; i < keys.length; ++i) {
      test(() {
          var key = localStorage.keys[i];
          assert_not_equals(key, null);
          assert_true(keys.indexOf(key) >= 0, "Unexpected key $key found.");
      }, "key($i) should return the right thing.");
  }
  test(() {
      assert_equals(localStorage.keys[-1], null, "localStorage.key(-1)");
      assert_equals(localStorage.keys[4], null, "localStorage.key(4)");
  }, "key() should return null for out-of-range arguments.");
    checkTestFailures();
}
