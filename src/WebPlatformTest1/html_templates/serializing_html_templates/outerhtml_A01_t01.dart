/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Template contents should be serialized instead of template
 * element if serializing template element.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Base test', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerHtml = 'some text';
    template.content.append(div);

    Expect.equals('<template><div id="div1">some text</div></template>',
        template.outerHtml);
  });

  test('Test nested template', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    var nestedTemplate = doc.createElement('template');

    template.content.append(nestedTemplate);

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerHtml = 'some text';
    nestedTemplate.content.append(div);

    Expect.equals('<template><template><div id="div1">some text</div></template></template>',
        template.outerHtml);
  });

  test('Test serializing whole document', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerHtml = 'some text';
    template.content.append(div);
    doc.body.append(template);

    Expect.equals('<html><head><title>Test Document</title></head><body><template><div id="div1">some text</div></template></body></html>',
        doc.documentElement.outerHtml);
  });
}