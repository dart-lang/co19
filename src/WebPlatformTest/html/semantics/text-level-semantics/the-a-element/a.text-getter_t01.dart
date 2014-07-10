/**
 * after web-platform-tests/html/semantics/text-level-semantics/the-a-element/a.text-getter-01.html
 * @assertion
 * http://www.whatwg.org/html5/#dom-a-text
 * @description HTMLAnchorElement.text getting 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL = r'''
<div id="test">
<a href="a">a b c </a>
<a href="b">a <!--b-->b c </a>
<a href="c">a <b>b</b> c </a>
<a href="d">a <script>b</script> c </a>
</div>
''';

void main() {
  document.body.appendHtml(htmlEL);
  var b;
  var e = document.getElementById("test")
                .append(document.createElement("a"));
  e.href = "d";
  e.append(new Text("a "));
  e.append(new Text("b "));
  e.append(new Text("c "));
  var list = document.getElementById("test")
                     .queryAll("a");

  for (var i = 0, il = list.length; i < il; ++i) {
    test(() {
      assert_equals(list[i].text, "a b c ");
    }, "Test for anchor $i");
  }
  
  checkTestFailures();
}
