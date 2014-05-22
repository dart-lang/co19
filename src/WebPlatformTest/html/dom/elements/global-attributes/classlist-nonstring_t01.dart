/**
 * after web-platform-tests/html/dom/elements/global-attributes/classlist-nonstring.html
 * @assertion 
 * <link rel="help" href="http://www.whatwg.org/html5/#classes">
 * <link rel="help" href="http://www.whatwg.org/html5/#domtokenlist">
 * <link rel="help" href="http://dev.w3.org/2006/webapi/WebIDL/#es-DOMString">
 * <link rel="help" href="http://www.ecma-international.org/publications/files/ECMA-ST/ECMA-262.pdf#page=57">
 * @description classList: non-string contains
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<ul>
<li class=null>
<li class=0>
<li class=NaN>
<li class=Infinity>
<li class=-Infinity>
</ul>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);

//var items = document.getElementById("test").getElementsByTagName("li");
var items = document.querySelector('#test').queryAll('li');
var tests = [null, 0, double.NAN, double.INFINITY, -double.INFINITY];

  for (var i = 0, il = items.length; i < il; ++i) {
    var cls=items[i].classes;
//    print("cls=$cls");
    assert_equals(cls.length, 1);
    assert_equals(cls.first, tests[i].toString(), "i=$i");
  }
  checkTestFailures();
}
