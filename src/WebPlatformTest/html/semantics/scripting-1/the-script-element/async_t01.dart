/**
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/async_001.htm
 * @assertion
 * http://dev.w3.org/html5/spec/scripting-1.html#dom-script-async
 * @description This test checks the Async property on a dynamically-created script element.
 * By default it should be true. 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  ScriptElement script=document.createElement("script");
  assert_true(script.async);
}