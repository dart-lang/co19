/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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
 * @assertion The template contents owner document type is HTML document,
 * if template is declared in HTML document
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');
    var div = doc.createElement('div');
    template.append(div);

    doc.body.append(template);

    Expect.isTrue(template.content.ownerDocument is HtmlDocument,
      'Template content owner should be a HTML document');

  }, 'The template contents owner document type is HTML document ' +
  '(case when document has no browsing context and the template is created ' +
    'by createElement())');

  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template><div>Hello!</div></template>';
    var template = doc.querySelector('template');

    Expect.isTrue(template.content.ownerDocument is HtmlDocument,
      'Template content owner should be a HTML document');

  }, 'The template contents owner document type is HTML document ' +
  '(case when document has no browsing context and the template is created via innerHtml)');
}
