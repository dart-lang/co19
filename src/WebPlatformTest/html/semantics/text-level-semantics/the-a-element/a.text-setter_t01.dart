/**
 * after web-platform-tests/html/semantics/text-level-semantics/the-a-element/a.text-getter-01.html
 * @assertion
 * http://www.whatwg.org/html5/#dom-a-text
 * @description HTMLAnchorElement.text setting
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<a href="a">a b c</a>
<a href="b">a <!--b--> c</a>
<a href="c">a <b>b</b> c</a>
<script>
</script>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  var d = document.getElementById("test")
                .append(document.createElement("a"));
  d.href = "d";
  d.append(new Text("a "));
  d.append(new Text("b "));
  d.append(new Text("c "));
  var list = document.getElementById("test")
                     .queryAll("a");
  for (var i = 0, il = list.length; i < il; ++i) {
    test(() {
      list[i].text = "x";
      assert_equals(list[i].text, "x");
      assert_equals(list[i].firstChild.data, "x");
      assert_equals(list[i].childNodes.length, 1);
    }, "Test for anchor $i");
  }
  
  checkTestFailures();
}
