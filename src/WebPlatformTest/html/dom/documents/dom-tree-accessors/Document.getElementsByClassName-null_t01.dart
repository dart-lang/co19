/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/Document.getElementsByClassName-null-undef.html
 * @assertion http://www.whatwg.org/specs/web-apps/current-work/epub.html
 * (originally http://www.whatwg.org/html5/#dom-getelementsbyclassname)
 * @description getElementsByClassName and null/undefined
 * the spec requires the arg to be a string, so I think the original test is wrong.
 * changed the test to check for exception 
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const fragment='''
<div id="log"></div>
<div id="test">
<p id="p1"></p>
<p class="undefined" id="p2"></p>
<p class="null" id="p3"></p>
<p class="undefined null" id="p4"></p>
</div>
''';

void main() {
  document.body.appendHtml(fragment);
  Expect.throws((){
    document.getElementsByClassName(null);
  });
}
