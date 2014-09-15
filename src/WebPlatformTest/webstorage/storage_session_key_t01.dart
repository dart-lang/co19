/**
 * after web-platform-tests/webstorage/storage_session_key.html
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
  sessionStorage["a"]="1";
  sessionStorage["b"]="2";

  var keys = ["name", "age", "a", "b"];
  int i=0;
  for (var key in sessionStorage.keys) {
      test(() {
          assert_not_equals(key, null);
          assert_true(keys.indexOf(key) >= 0, "Unexpected key $key found.");
      }, "key($i) should return the right thing.");
      i++;
  }
  
  checkTestFailures();
}
