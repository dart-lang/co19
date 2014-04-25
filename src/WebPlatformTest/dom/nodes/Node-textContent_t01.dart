/*
 * after web-platform-tests/dom/nodes/Node-textContent.html
 *
 * @assertion Node.textContent
 * @description
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

var documents = [
    [document, "parser"],
    [document.implementation.createDocument("", "test", null), "createDocument"],
    [document.implementation.createHtmlDocument("title"), "createHtmlDocument"],
  ];
  
var  doctypes = [
 //   [document.doctype, "parser"],
    [document.implementation.createDocumentType("x", "", ""), "script"],
  ];

// Getting
// DocumentFragment, Element:
test(() {
  var element = document.createElement("div");
  assert_equals(element.text, "");
}, "For an empty Element, textContent should be the empty string");

test(() {
  assert_equals(document.createDocumentFragment().text, "");
}, "For an empty DocumentFragment, textContent should be the empty string");

test(() {
  var el = document.createElement("div");
  el.append(new Comment(" abc "));
  el.append(new Text("\tDEF\t"));
//  el.append(document.createProcessingInstruction("x", " ghi "));
  assert_equals(el.text, "\tDEF\t");
}, "Element with children");

test(() {
  var el = document.createElement("div");
  var child = document.createElement("div");
  el.append(child);
  child.append(new Comment(" abc "));
  child.append(new Text("\tDEF\t"));
//  child.append(document.createProcessingInstruction("x", " ghi "));
  assert_equals(el.text, "\tDEF\t");
}, "Element with descendants");

test(() {
  var df = document.createDocumentFragment();
  df.append(new Comment(" abc "));
  df.append(new Text("\tDEF\t"));
//  df.append(document.createProcessingInstruction("x", " ghi "));
  assert_equals(df.text, "\tDEF\t");
}, "DocumentFragment with children");

test(() {
  var df = document.createDocumentFragment();
  var child = document.createElement("div");
  df.append(child);
  child.append(new Comment(" abc "));
  child.append(new Text("\tDEF\t"));
//  child.append(document.createProcessingInstruction("x", " ghi "));
  assert_equals(df.text, "\tDEF\t");
}, "DocumentFragment with descendants");

// Text, ProcessingInstruction, Comment:
test(() {
  assert_equals(new Text("").text, "");
}, "For an empty Text, textContent should be the empty string");

test(() {
  assert_equals(new Comment("").text, "");
}, "For an empty Comment, textContent should be the empty string");

test(() {
  assert_equals(new Text("abc").text, "abc");
}, "For a Text with data, textContent should be that data");

test(() {
  assert_equals(new Comment("abc").text, "abc");
}, "For a Comment with data, textContent should be that data");

// Any other node:
documents.forEach((argument) {
  var doc = argument[0], creator = argument[1];
  test(() {
    assert_equals(doc.text, null);
  }, "For Documents created by " + creator + ", textContent should be null");
});

doctypes.forEach((argument) {
  var doctype = argument[0], creator = argument[1];
  test(() {
    assert_equals(doctype.text, null);
  }, "For DocumentType created by " + creator + ", textContent should be null");
});

// Setting
// DocumentFragment, Element:
var arguments = [
  [null, null],
  ["", null],
//  [42, "42"],
  ["abc", "abc"],
  ["<b>xyz<\/b>", "<b>xyz<\/b>"],
  ["d\0e", "d\0e"]
  // XXX unpaired surrogate?
];

arguments.forEach((aValue) {
  var argument = aValue[0], expectation = aValue[1];
  void check(var aElementOrDocumentFragment) {
    if (expectation == null) {;
      assert_equals(aElementOrDocumentFragment.text, "");
      assert_equals(aElementOrDocumentFragment.firstChild, null);
    } else {
      assert_equals(aElementOrDocumentFragment.text, expectation);
      assert_equals(aElementOrDocumentFragment.childNodes.length, 1,
                    "Should have one child");
      var firstChild = aElementOrDocumentFragment.firstChild;
      assert_true(firstChild is Text, "child should be a Text");
      assert_equals(firstChild.data, expectation);
    }
  };

  test(() {
    var el = document.createElement("div");
    el.text = argument;
    check(el);
  }, "Element without children set to " + format_value(argument));

  test(() {
    var el = document.createElement("div");
    var text = el.append(new Text(""));
    el.text = argument;
    check(el);
    assert_equals(text.parentNode, null,
                  "Preexisting Text should have been removed");
  }, "Element with empty text node as child set to " + format_value(argument));

  test(() {
    var el = document.createElement("div");
    el.append(new Comment(" abc "));
    el.append(new Text("\tDEF\t"));
//    el.append(document.createProcessingInstruction("x", " ghi "));
    el.text = argument;
    check(el);
  }, "Element with children set to " + format_value(argument));

  test(() {
    var el = document.createElement("div");
    var child = document.createElement("div");
    el.append(child);
    child.append(new Comment(" abc "));
    child.append(new Text("\tDEF\t"));
//    child.append(document.createProcessingInstruction("x", " ghi "));
    el.text = argument;
    check(el);
    assert_equals(child.childNodes.length, 2,
                  "Should not have changed the internal structure of the removed nodes.");
  }, "Element with descendants set to " + format_value(argument));

  test(() {
    var df = document.createDocumentFragment();
    df.text = argument;
    check(df);
  }, "DocumentFragment without children set to " + format_value(argument));

  test(() {
    var df = document.createDocumentFragment();
    var text = df.append(new Text(""));
    df.text = argument;
    check(df);
    assert_equals(text.parentNode, null,
                  "Preexisting Text should have been removed");
  }, "DocumentFragment with empty text node as child set to " + format_value(argument));

  test(() {
    var df = document.createDocumentFragment();
    df.append(new Comment(" abc "));
    df.append(new Text("\tDEF\t"));
//    df.append(document.createProcessingInstruction("x", " ghi "));
    df.text = argument;
    check(df);
  }, "DocumentFragment with children set to " + format_value(argument));

  test(() {
    var df = document.createDocumentFragment();
    var child = document.createElement("div");
    df.append(child);
    child.append(new Comment(" abc "));
    child.append(new Text("\tDEF\t"));
//    child.append(document.createProcessingInstruction("x", " ghi "));
    df.text = argument;
    check(df);
    assert_equals(child.childNodes.length, 2,
                  "Should not have changed the internal structure of the removed nodes.");
  }, "DocumentFragment with descendants set to " + format_value(argument));
});

// Text, ProcessingInstruction, Comment:
test(() {
  var text = new Text("abc");
  text.text = "def";
  assert_equals(text.text, "def");
  assert_equals(text.data, "def");
}, "For a Text, textContent should set the data");


test(() {
  var comment = new Comment("abc");
  comment.text = "def";
  assert_equals(comment.text, "def");
  assert_equals(comment.data, "def");
}, "For a Comment, textContent should set the data");

// Any other node:
documents.forEach((argument) {
  var doc = argument[0], creator = argument[1];
  test(() {
    var root = doc.documentElement;
    doc.text = "a";
    assert_equals(doc.text, null);
    assert_equals(doc.documentElement, root);
  }, "For Documents created by " + creator + ", setting textContent should do nothing");
});

/*
doctypes.forEach((argument) {
  var doctype = argument[0], creator = argument[1];
  test(() {
    var name = doctype.name;
    var publicId = doctype.publicId;
    var systemId = doctype.systemId;
    doctype.text = "b";
    assert_equals(doctype.text, null);
    assert_equals(doctype.name, name, "name should not change");
    assert_equals(doctype.publicId, publicId, "publicId should not change");
    assert_equals(doctype.systemId, systemId, "systemId should not change");
  }, "For DocumentType created by " + creator + ", setting textContent should do nothing");
});
*/

checkTestFailures();
}