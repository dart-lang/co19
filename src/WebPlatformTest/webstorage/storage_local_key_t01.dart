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
  int i=0;
  for (var key in localStorage.keys) {
      test(() {
          assert_not_equals(key, null);
          assert_true(keys.indexOf(key) >= 0, "Unexpected key $key found.");
      }, "key($i) should return the right thing.");
      i++;
  }
  
  checkTestFailures();
}
