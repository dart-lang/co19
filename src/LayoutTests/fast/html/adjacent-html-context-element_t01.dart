/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests inserting a td element "beforeBegin" of another td
 * element using insertAdjacentHTML.
 * If the context element was not properly adjusted, then td will be stripped
 * by the parser.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testcommon.dart";

main() {
  var body = document.body;

  body.setInnerHtml('''
<p>This tests inserting a td element "beforeBegin" of another td element using insertAdjacentHTML.
If the context element was not properly adjusted, then td will be stripped by the parser.</p>
<table><tr><td></td></tr></table>
''', treeSanitizer: new NullTreeSanitizer());

  var td = document.querySelector('td');
  td.insertAdjacentHtml('beforeBegin', '<td></td>');

  Expect.equals(2, document.getElementsByTagName('td').length);
}

