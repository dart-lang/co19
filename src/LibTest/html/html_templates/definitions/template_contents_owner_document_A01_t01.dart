/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If template's enclosing document has no browsing context,
 * it must be template contents owner.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test when document has no browsing context and the template is created by createElement', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    doc.body.append(template);

    Expect.equals(doc, template.content.ownerDocument);
  });

  test('Test when document has no browsing context and the template is created by innerHtml', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml = '<template><div>some text</div></template>';

    var template = doc.querySelector('template');

    Expect.equals(doc, template.content.ownerDocument);
  });
}