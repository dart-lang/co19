/**
 * after web-platform-tests/html/semantics/forms/the-button-element/button-validation.html
 * @assertion
 * <link rel="help" href="http://www.w3.org/TR/html51/forms.html#the-button-element">
 * @description Button - events
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<button id=btn1>button</button>
<button id=btn2 type=submit>button</button>
<button id=btn3 type=reset>button</button>
<button id=btn4 type=button>button</button>
<button id=btn5 type=menu>button</button>
<button id=btn6 type=foobar>button</button>
''';

void main() {
  document.body.appendHtml(htmlEL);

  void willValid(element, expectedType, willValidate, desc) {
    test((){
      assert_equals(element.type, expectedType, "expectedType");
      assert_equals(element.willValidate, willValidate, "willValidate");
    }, desc);
  }

  willValid(document.getElementById('btn1'), "submit", true, "missing type attribute");
  willValid(document.getElementById('btn2'), "submit", true, "submit type attribute");
  willValid(document.getElementById('btn3'), "reset", false, "reset type attribute");
  willValid(document.getElementById('btn4'), "button", false, "button type attribute");
  willValid(document.getElementById('btn5'), "menu", false, "menu type attribute");
  willValid(document.getElementById('btn6'), "submit", true, "invalid type attribute");

 checkTestFailures();
}
