/**
 * after web-platform-tests/html/semantics/forms/the-input-element/search_input.html
 * @assertion
 * http://www.w3.org/TR/html5/the-input-element.html#the-input-element
 * @description Search Input
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
        <h1>Search Input</h1>
        <input type="search" style="display:none" placeholder="Search..." />
''';

void main() {
  document.body.appendHtml(htmlEL);

  test(() {
    assert_equals(document.getElementsByTagName("input")[0].type, "search");}
    , "search type support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-type" });
    
  test(() {
    assert_equals(document.getElementsByTagName("input")[0].placeholder, "Search...");}
    , "placeholder attribute support on input element"
    , {"help" : "http://www.w3.org/TR/html5/the-input-element.html#dom-input-placeholder" });

  checkTestFailures();
}
