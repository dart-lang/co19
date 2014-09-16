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
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.title-05.html
 * @assertion http://www.whatwg.org/html5/#document.title
 * @description document.title  and White_Space characters
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

void main() {
  var White_Space = [
    "\u000B",
    "\u0085",
    "\u00A0",
    "\u1680",
    "\u180E",
    "\u2000",
    "\u2001",
    "\u2002",
    "\u2003",
    "\u2004",
    "\u2005",
    "\u2006",
    "\u2007",
    "\u2008",
    "\u2009",
    "\u200A",
    "\u2028",
    "\u2029",
    "\u202F",
    "\u205F",
    "\u3000"];

  for (var i = 0; i < White_Space.length; i++) {
    var w=White_Space[i];
    String title = "a${w}${w}b${w}c$i";
    document.title = title;
    assert_equals(document.title, title, "title[$i]=$title;");
  }
}
