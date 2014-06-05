/**
 * after web-platform-tests/html/semantics/forms/the-datalist-element/datalistelement.html
 * @assertion
 *     <link href="http://www.w3.org/TR/html5/forms.html#the-datalist-element" rel="help">
 * @description datalist element
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
    <datalist id="datalist1" style="display: none">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
    </datalist>
''';

void main() {
  document.body.appendHtml(htmlEL);

  test(() {
    assert_true(document.getElementsByTagName("datalist")[0] is DataListElement);
  }, "DataListElement support");
  
  test(() {
    assert_equals(document.getElementsByTagName("datalist")[0].options.item(0), document.getElementsByTagName("option")[0]);
  }, "DataListElement options item collection support");
  
  checkTestFailures();
}
