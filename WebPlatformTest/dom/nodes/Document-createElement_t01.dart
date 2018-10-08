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
/*
 * after web-platform-tests/dom/nodes/Document-createElement-namespace.html
 *
 * @assertion Document.createElement()
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-createelement">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-localname">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-tagname">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-prefix">
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-element-namespaceuri">
 *
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

String toASCIIUppercase(String str) {
  var diff = "a".codeUnitAt(0) - "A".codeUnitAt(0);
  var res = "";
  for (var i = 0; i < str.length; ++i) {
    if ("a".codeUnitAt(0) <= str.codeUnitAt(i)
        && str.codeUnitAt(i) <= "z".codeUnitAt(0)) {
      res += new String.fromCharCode(str.codeUnitAt(i) - diff);
    } else {
      res += str[i];
    }
  }
  return res;
}

void main() {


  var HTMLNS = "http://www.w3.org/1999/xhtml",
      valid = [
        //[input, localName],
        //[undefined, "undefined"],
        [null, "null"],
        ["foo", "foo"],
        ["f1oo", "f1oo"],
        ["foo1", "foo1"],
        ["f\u0300oo", "f\u0300oo"],
        ["foo\u0300", "foo\u0300"],
        [":foo", ":foo"],
        ["f:oo", "f:oo"],
        ["foo:", "foo:"],
        ["xml", "xml"],
        ["xmlns", "xmlns"],
        ["xmlfoo", "xmlfoo"],
        ["xml:foo", "xml:foo"],
        ["xmlns:foo", "xmlns:foo"],
        ["xmlfoo:bar", "xmlfoo:bar"],
        ["svg", "svg"],
        ["math", "math"],
        ["FOO", "foo"],
        ["mar\u212a", "mar\u212a"],
        ["\u0130nput", "\u0130nput"],
        ["\u0131nput", "\u0131nput"]
     ],
     invalid = [
       "",
       "1foo",
       "\u0300foo",
       "}foo",
       "f}oo",
       "foo}",
       "\ufffffoo",
       "f\uffffoo",
       "foo\uffff",
       "<foo",
       "foo>",
       "<foo>",
       "f<oo"
     ];

  valid.forEach((t) {
    test(() {
      var elt = document.createElement(t[0]);
      assert_true(elt is Element);
      assert_true(elt is Node);
      assert_equals(elt.localName, t[1]);
      assert_equals(elt.tagName, toASCIIUppercase(t[1]));
      assert_equals(elt.namespaceUri, HTMLNS);
    }, "createElement(" + format_value(t[0]) + ")");
  });
  invalid.forEach((arg) {
    assert_throws("INVALID_CHARACTER_ERR", () { document.createElement(arg); });
  });


checkTestFailures();
}
