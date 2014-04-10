/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#attr">
 * 
 * @description (was:AttrExodus) This test has no sense for Dart, as attribute is not an object, but
 * a key-value pair.
 */

import 'dart:html';
import "../../../Utils/expectWeb.dart";

void main() {
  document.body.setAttribute("abc", "pass");
  var attrs = document.body.attributes;
  Expect.equals(1, attrs.length);
  var attrKey = attrs.keys[0];
  var attrValue = attrs[attrKey];
//  print("attr = $attrKey: $attrValue}");
  Expect.equals("abc", attrKey);
  Expect.equals("pass", attrValue);
}
