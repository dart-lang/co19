/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The template contents owner document type is HTML document,
 * if template is declared in HTML document.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test when document has no browsing context and the template is created by createElement', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    var div = doc.createElement('div');
    template.append(div);

    doc.body.append(template);

    Expect.isTrue(template.content.ownerDocument is HtmlDocument);
  });

  test('Test when document has no browsing context and the template is created by innerHtml', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml = '<template><div>Hello!</div></template>';
    var template = doc.querySelector('template');

    Expect.isTrue(template.content.ownerDocument is HtmlDocument);
  });
}