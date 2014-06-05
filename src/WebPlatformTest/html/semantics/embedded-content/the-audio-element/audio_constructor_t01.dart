/**
 * after web-platform-tests/html/semantics/embedded-content/the-audio-element/audio_constructor.html
 * @assertion 
 * @description AudioElement constructor
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

  var throwingObject = () {
    throw Error();
  };

  var tests = [
    [() { return new AudioElement() ;}, null, "No arguments, with new"],
    [() { return new AudioElement("") ;}, "", "Empty string argument, with new"],
    [() { return new AudioElement("src") ;}, "src", "Non-empty string argument, with new"],
    [() { return new AudioElement(null) ;}, null, "Null argument, with new"],
  ];

  tests.forEach((t) {
    var fn = t[0], expectedSrc = t[1], description = t[2];
    test(() {
      var element = fn();
      assert_equals(element.localName, "audio");
      assert_equals(element.tagName, "AUDIO");
      assert_equals(element.namespaceUri, "http://www.w3.org/1999/xhtml");
      assert_equals(element.nodeType, Node.ELEMENT_NODE);
      assert_equals(element.getAttribute("preload"), "auto");
      assert_equals(element.getAttribute("src"), expectedSrc);
      assert_equals(element.ownerDocument, document);
    }, description);
  });

test(() {
  assert_throws("NoSuchMethodError", () {
    new AudioElement("", throwingObject);
  });
}, "Extra argument");
  
   checkTestFailures();
}
