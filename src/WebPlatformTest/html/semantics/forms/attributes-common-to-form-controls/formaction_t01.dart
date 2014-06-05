/**
 * after web-platform-tests/html/semantics/forms/attributes-common-to-form-controls/formAction.html
 * @assertion  
 *    <link href="http://www.w3.org/TR/html5/forms.html#dom-fs-formaction" rel="help">
 * @description formaction on button element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <button formaction="http://www.example.com/" style="display: none" type="submit">Submit</button>
        <input formaction="http://www.example.com/" style="display: none" type="submit" value="submit">
        <input style="display: none" type="submit" value="submit">
        <input formaction="" style="display: none" type="submit" value="submit">
''';

void main() {
  document.body.appendHtml(htmlEL);
  
  var button=document.getElementsByTagName("button")[0];
  var inputs=document.getElementsByTagName("input");
  
  Element relativeToAbsolute(relativeURL) {
    var a = document.createElement('a');
    a.href = relativeURL;
    return a.href;
  }
  test(() {
    assert_equals(button.formAction, "http://www.example.com/");
  }, "formAction on button support");
  
  test(() {
    assert_equals(inputs[0].formAction, "http://www.example.com/");
  }, "formAction on input support");

  var testElem = inputs[0];
  testElem.formAction = "http://www.example.com/page2.html";

  test(() {
    assert_equals(inputs[0].formAction, "http://www.example.com/page2.html");
    }, "formaction absolute URL value on input reflects correct value after being updated by the DOM");
    
  test(() {
    assert_equals(inputs[0].getAttribute("formaction"), "http://www.example.com/page2.html");
  }, "formAction absolute URL value is correct using getAttribute");

  testElem = inputs[0];
  testElem.formAction = "../page3.html";

  test(() {
    assert_equals(inputs[0].formAction, relativeToAbsolute('../page3.html'));
  }, "formAction relative URL value on input reflects correct value after being updated by the DOM");
  
  test(() {
    assert_equals(inputs[0].getAttribute("formaction"), "../page3.html");
  }, "formAction relative URL value is correct using getAttribute");

  test(() {
    assert_equals(inputs[1].formAction, document.baseUri);
  }, "On getting, when formaction is missing, the document's address must be returned");
  
  test(() {
    assert_equals(inputs[2].formAction, document.baseUri);
  }, "On getting, when formaction value is the empty string, the document's address must be returned");

  checkTestFailures();
}
