/**
 * after web-platform-tests/webstorage/storage_local_removeitem.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description 
 */
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
  Storage localStorage=window.localStorage;
  localStorage.clear();
  localStorage["name"]="user1";
  assert_equals(localStorage["name"], "user1");

  localStorage.remove("name");
  localStorage.remove("unknown");
  assert_equals(localStorage["name"], null, "localStorage['name']");
}
