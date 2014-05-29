/**
 * after web-platform-tests/html/semantics/edits/the-del-element/del_effect.html
 * @assertion http://www.w3.org/TR/2012/CR-html5-20121217/edits.html#the-del-element
 * @description Text in the del element should be 'line-through'
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<p><del>crossed-off text</del></p>
''';

void main() {
  document.body.appendHtml(htmlEL);
  var element = document.getElementsByTagName('del')[0];
  var textDecoration = element.getComputedStyle().textDecorationLine;
  if (textDecoration==null || textDecoration == "") {
    textDecoration = element.getComputedStyle().textDecoration;
  }
  print("textDecoration=$textDecoration");
  Expect.isTrue(textDecoration.contains('line-through'));
 }
