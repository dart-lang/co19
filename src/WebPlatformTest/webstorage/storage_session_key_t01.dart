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
  for (var i = 0; i < keys.length; ++i) {
      test(() {
          var key = sessionStorage.keys[i];
          assert_not_equals(key, null);
          assert_true(keys.indexOf(key) >= 0, "Unexpected key $key found.");
      }, "key($i) should return the right thing.");
  }
  
  test(() {
      assert_throws("RangeError", () {
         var x=sessionStorage.keys[-1];
      }, "sessionStorage.key(-1)");
      assert_throws("RangeError", () {
         var x=sessionStorage.keys[4];
      }, "sessionStorage.key(4)");
  }, "key() should throw for out-of-range arguments.");
  
  checkTestFailures();
}
