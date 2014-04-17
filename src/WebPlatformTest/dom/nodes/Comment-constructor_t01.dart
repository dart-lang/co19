/*
 * after web-platform-tests/dom/nodes/Comment-constructor.html
 *
 * @assertion Comment constructor
 * <link rel=help href="http://dom.spec.whatwg.org/#dom-comment">
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

test(() {
  var comment = new Comment();
  assert_true(comment is Node, "Should be a Node");
  assert_true(comment is CharacterData, "Should be a CharacterData");
  assert_true(comment is Comment, "Should be a Comment");
}, "new Comment(): is");

test(() {
  var comment = new Comment();
  assert_equals(comment.data, "");
  assert_equals(comment.nodeValue, "");
  assert_equals(comment.ownerDocument, document);
}, "new Comment(): no arguments");

var arguments = [
  [null, ""],
  ["42", "42"],
  ["", ""],
  ["-", "-"],
  ["--", "--"],
  ["-->", "-->"],
  ["<!--", "<!--"],
  ["\u0000", "\u0000"],
  ["\u0000test", "\u0000test"],
  ["&amp;", "&amp;"],
];
arguments.forEach((a) {
  var argument = a[0], expected = a[1];
  test(() {
    var comment = new Comment(argument);
    assert_equals(comment.data, expected);
    assert_equals(comment.nodeValue, expected);
    assert_equals(comment.ownerDocument, document);
  }, "new Comment(${format_value(argument)})");
});

test( () {
  var iframe = document.createElement("iframe");
  asyncStart();
  iframe.onLoad.listen((ev) {
    asyncEnd();
//    var comment = new iframe.contentWindow.Comment();
    var comment = new Comment("");
//    assert_equals(comment.ownerDocument, iframe.contentDocument);
    assert_equals(comment.ownerDocument, iframe.ownerDocument);
  });
  document.body.append(iframe);
}, "new Comment() should get the correct ownerDocument across globals");

checkTestFailures();
}
