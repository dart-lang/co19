/*
 * after web-platform-tests/dom/nodes/Node-parentNode.html
 *
 * @assertion Node.parentNode
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  document.body.appendHtml("""
<iframe id=a src="data:text/html,<a name='c'>c</a>"></iframe>
"""
);

// XXX need to test for more node types
test(() {
  assert_equals(document.parentNode, null);
}, "Document");

/*
test(() {
  assert_equals(document.doctype.parentNode, document);
}, "Doctype");
*/

test(() {
  assert_equals(document.documentElement.parentNode, document);
}, "Root element");

test(() {
  var el = document.createElement("div");
  assert_equals(el.parentNode, null);
  document.body.append(el);
  assert_equals(el.parentNode, document.body);
}, "Element");

IFrameElement iframe=document.getElementById("a");
test(() {
  iframe.onLoad.drain().then((v) {
    var doc = iframe.contentDocument;
    iframe.parentNode.removeChild(iframe);
    assert_equals(doc.firstChild.parentNode, doc);
    asyncEnd();
  },
  onError: (e) {
     throw e;
 });
}, "Removed iframe");

checkTestFailures();
}
