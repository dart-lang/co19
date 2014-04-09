/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattributens">
 * 
 * @description XML-namespaced attributes don't need an xml prefix
 * @issue #16395
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

const XML = "http://www.w3.org/XML/1998/namespace";

void main() {
  var el = document.createElement("span");
  el.setAttributeNS(XML, "a:bb", "pass");
  document.body.append(el);
  var nsattrs=new Map.from(el.getNamespacedAttributes(XML));
  print(" nsattrs=$nsattrs");
  Expect.mapEquals({"a:bb":"pass"}, nsattrs);
}