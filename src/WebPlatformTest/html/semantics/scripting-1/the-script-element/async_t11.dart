/**
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/async_011.htm
 * @assertion
 * http://dev.w3.org/html5/spec/scripting-1.html#prepare-a-script
 * @description An empty parser-inserted script element should return async=true
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
        <script id="scr"></script>
''';

void main() {
  document.body.appendHtml(htmlEL);
  ScriptElement scr=document.getElementById("scr");
  assert_true(scr.async, 
   "An empty parser-inserted script element should return async=true");
}