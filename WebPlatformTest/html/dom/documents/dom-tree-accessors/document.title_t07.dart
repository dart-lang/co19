/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.title-07.html
 * @assertion http://www.whatwg.org/html5/#document.title
 * @description document.title and DOMImplementation.createHTMLDocument
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {

void checkDoc(title, expectedtitle, normalizedtitle) {
  test(() {
    var doc = document.implementation.createHTMLDocument(title);
    assert_equals(doc.title, normalizedtitle);
  }
  ,"expectedtitle=$expectedtitle"
  );
}

checkDoc("", "", "");
checkDoc(null, "null", "null");
checkDoc("foo  bar baz", "foo  bar baz", "foo bar baz");
checkDoc("foo\t\tbar baz", "foo\t\tbar baz", "foo bar baz");
checkDoc("foo\n\nbar baz", "foo\n\nbar baz", "foo bar baz");
checkDoc("foo\f\fbar baz", "foo\f\fbar baz", "foo bar baz");
checkDoc("foo\r\rbar baz", "foo\r\rbar baz", "foo bar baz");

test(() {
  var doc = document.implementation.createHTMLDocument();
  assert_equals(doc.title, "");
}, "Missing title argument");

checkTestFailures();
}
