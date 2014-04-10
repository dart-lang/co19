/*
 * after web-platform-tests/dom/nodes/attributes.html
 *
 * @assertion <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-setattribute">
 * 
 * @description setAttribute should throw a NAMESPACE_ERR when qualifiedName starts with 'xmlns'
 * @needsreview specs differ: MDN says nothing about 'xmlns'
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {
  var el = document.createElement("foo");
  var tests = ["xmlns", "xmlns:a", "xmlnsx", "xmlns0"];
  for (var i = 0; i < tests.length; i++) {
    String xname=tests[i];
//    el.setAttribute(xname, "fail");
    assert_throws("NAMESPACE_ERR",
                  () { el.setAttribute(xname, "fail"); }
                  ,"Expected exception for " + xname + "."
                 );
  }
}