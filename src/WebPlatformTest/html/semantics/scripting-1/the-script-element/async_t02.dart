/**
 * after web-platform-tests/html/semantics/scripting-1/the-script-element/async_002.htm
 * @assertion
 * http://dev.w3.org/html5/spec/scripting-1.html#dom-script-async
 * @description Changes to the 'async' attribute are reflected in the async property
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
''';

void main() {
  document.body.appendHtml(htmlEL);
  
          test(() {
            var s = document.createElement("script");
            s.async = false;
            s.setAttribute('async', ''); /*Should change s.async to true*/
            assert_true(s.async);
          }, "Test 'async' attribute are reflected in the async property with setAttribute");

          test(() {
            var s = document.createElement("script");
            s.async = false;
            s.setAttribute('async', ''); /*Should change s.async to true*/
            s.attributes.remove('async'); /*Should change s.async to false*/
            assert_false(s.async);
          }, "Test 'async' attribute are reflected in the async property with attributes.remove");
          
  checkTestFailures();
}