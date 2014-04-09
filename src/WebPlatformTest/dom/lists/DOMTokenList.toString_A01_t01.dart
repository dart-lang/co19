/*
 * after web-platform-tests/dom/lists/DOMTokenList-stringifier.html
 *
 * @assertion http://dom.spec.whatwg.org/#dom-domtokenlist-stringifier
 * TODO rename and move to more appropriate directory
 */

import 'dart:html';
import "../../../Utils/expect.dart";

void main() {
  var span = new Element.html('<span class="   a  a b"></span>');
  Expect.equals(span.getAttribute("class"), "   a  a b",
                "getAttribute should return the literal value");
  Expect.equals(span.className, "   a  a b",
                "className should return the literal value");
  Expect.equals(span.classes.toString(), "a b",
                "classes.toString() should compress whitespace");
  Expect.equals(span.classes.toString(), "a b",
                "classes.toString() should compress whitespace");
//  print("cl=${span.classes.runtimeType}");
  Expect.isTrue(span.classes is CssClassSet);
}
