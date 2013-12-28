/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If template's enclosing document has browsing context, then
 * templates content owner must be a new Document node without browsing context
 * @needsreview Seems to be impossible to test in iframe
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  /*
  testInIFrame(null, (context) {
    var doc = context.iframes[0].contentDocument;
    var template = doc.createElement('template');

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerText = 'Some text';

    template.append(div);

    doc.body.append(template);

    // doc has browsing context. There should be another document as a template
    // content owner
    Expect.notEquals(doc, template.content.ownerDocument);
  }, 'Test when document has browsing context and the template is created by createElement');

  testInIFrame(null, (context) {
    var doc = context.iframes[0].contentDocument;

    doc.body.innerHtml = '<template><div>some text</div></template>';

    var template = doc.querySelector('template');

    // doc has browsing context. There should be another document as a template
    // content owner
    Expect.notEquals(doc, template.content.ownerDocument);
  }, 'Test when document has browsing context and the template is created by innerHtml');
  */
}
