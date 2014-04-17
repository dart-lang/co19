/*
 * after web-platform-tests/dom/nodes/DOMImplementation-createHTMLDocument.html
 * <link rel=help href="http://dom.spec.whatwg.org/#dom-domimplementation-createhtmldocument">
 *
 * @assertion DOMImplementation.createHTMLDocument
 *
 * @description 
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void checkDoc(title, expectedtitle, normalizedtitle) {
  test(() {
    var doc = document.implementation.createHTMLDocument(title);
    assert_equals(doc.doctype.name, "html")
    assert_equals(doc.doctype.publicId, "")
    assert_equals(doc.doctype.systemId, "")
    assert_equals(doc.documentElement.localName, "html")
    assert_equals(doc.documentElement.firstChild.localName, "head")
    if (title !== undefined) {
      assert_equals(doc.documentElement.firstChild.childNodes.length, 1)
      assert_equals(doc.documentElement.firstChild.firstChild.localName, "title")
      assert_equals(doc.documentElement.firstChild.firstChild.firstChild.data,
                    expectedtitle)
    } else {
      assert_equals(doc.documentElement.firstChild.childNodes.length, 0)
    }
    assert_equals(doc.documentElement.lastChild.localName, "body")
    assert_equals(doc.documentElement.lastChild.childNodes.length, 0)
  })
}

void main() {

checkDoc("", "", "")
checkDoc(null, "null", "null")
checkDoc(undefined, "", "")
checkDoc("foo  bar baz", "foo  bar baz", "foo bar baz")
checkDoc("foo\t\tbar baz", "foo\t\tbar baz", "foo bar baz")
checkDoc("foo\n\nbar baz", "foo\n\nbar baz", "foo bar baz")
checkDoc("foo\f\fbar baz", "foo\f\fbar baz", "foo bar baz")
checkDoc("foo\r\rbar baz", "foo\r\rbar baz", "foo bar baz")

test(() {
  var doc = document.implementation.createHTMLDocument();
    assert_equals(doc.doctype.name, "html")
    assert_equals(doc.doctype.publicId, "")
    assert_equals(doc.doctype.systemId, "")
    assert_equals(doc.documentElement.localName, "html")
    assert_equals(doc.documentElement.firstChild.localName, "head")
    assert_equals(doc.documentElement.firstChild.childNodes.length, 0)
    assert_equals(doc.documentElement.lastChild.localName, "body")
    assert_equals(doc.documentElement.lastChild.childNodes.length, 0)
}, "Missing title argument");

checkTestFailures();
}