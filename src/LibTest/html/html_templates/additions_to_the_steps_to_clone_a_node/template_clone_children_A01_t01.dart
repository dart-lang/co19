/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Clone template node: all the children of template content are
 * copied if 'copy children flag' set to true.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test call to clone(true)', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml =
      '<template id="tmpl1">'
      '<div id="div1">This is div inside template</div>'
      '<div id="div2">This is another div inside template</div>'
      '</template>';

    var template = doc.querySelector('#tmpl1');
    var copy = template.clone(true);

    Expect.isNotNull(copy.content,
        'Template clone content attribute should not be null or undefined');

    Expect.equals(2, copy.content.childNodes.length,
        'Wrong number of template content\'s copy child nodes');

    Expect.isNotNull(copy.content.querySelector('#div1'),
        'Template child node should be copied');

    Expect.isNotNull(copy.content.querySelector('#div2'),
        'Template child node should be copied');
  });

  test('Test call to clone(false)', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml =
      '<template id="tmpl1">'
      '<div id="div1">This is div inside template</div>'
      '<div id="div2">This is another div inside template</div>'
      '</template>';

    var template = doc.querySelector('#tmpl1');
    var copy = template.clone(false);

    Expect.isNotNull(copy.content,
        'Template clone content attribute is null');

    Expect.equals(0, copy.content.childNodes.length,
        'Wrong number of template content\'s copy child nodes');
  });
}