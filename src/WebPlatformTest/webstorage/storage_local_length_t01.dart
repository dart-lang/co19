/**
 * after web-platform-tests/webstorage/storage_local_length_js.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
  Storage localStorage=window.localStorage;
  localStorage.clear();
  assert_equals(localStorage.length, 0, "localStorage.length");

  localStorage["name"] = "user1";
  localStorage["age"] = "20";

  assert_equals(localStorage.length, 2, "localStorage.length");
}
