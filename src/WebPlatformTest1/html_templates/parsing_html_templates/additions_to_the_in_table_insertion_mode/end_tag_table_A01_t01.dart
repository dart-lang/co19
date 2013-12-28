/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If parser is in 'in table' insertion mode and end tag table
 * is met then ignore this token.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

class NoCheck implements NodeTreeSanitizer {
  void sanitizeTree(Node node) {} // does nothing
}

main() {
  var doc = newHtmlDocument();

  doc.body.setInnerHtml(
    '<table id="table">'
    '<template id="template">'
    '</table>'
    '</template>'
    '<tr><td></td></tr>'
    '</table>',
    treeSanitizer: new NoCheck());

  var table = doc.querySelector('#table');
  var template = table.querySelector('#template');

  Expect.equals(2, table.childNodes.length,
      'Wrong number of table children');

  Expect.isNotNull(template,
      'Template element must be parsed');

  Expect.equals(1, table.rows.length,
      'Wrong number of table rows');

  Expect.equals(0, template.childNodes.length,
      'Wrong number of the template child nodes');

  Expect.equals(0, template.content.childNodes.length,
      'Wrong number of the template child nodes');
}
