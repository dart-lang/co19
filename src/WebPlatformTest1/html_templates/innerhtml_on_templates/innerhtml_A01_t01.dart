/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion innerHTML of template element replaces all referenced by the
 * content attribute.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  
  test('Base case', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');

    var div1 = doc.createElement('div');
    div1.setAttribute('id', 'div1');
    template.content.append(div1);

    Expect.isNotNull(template.content.querySelector('#div1'));

    template.innerHtml = '<div id="div2"></div>';

    Expect.isNull(template.content.querySelector('#div1'));

    Expect.isNotNull(template.content.querySelector('#div2'));
  });
  
  test('Nested template', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    var nestedTemplate = doc.createElement('template');

    template.content.append(nestedTemplate);

    var div1 = doc.createElement('div');
    div1.setAttribute('id', 'div1');
    nestedTemplate.content.append(div1);

    Expect.isNotNull(nestedTemplate.content.querySelector('#div1'));

    nestedTemplate.innerHtml = '<div id="div2"></div>';

    Expect.isNull(nestedTemplate.content.querySelector('#div1'));

    Expect.isNotNull(nestedTemplate.content.querySelector('#div2'));
  });
}
