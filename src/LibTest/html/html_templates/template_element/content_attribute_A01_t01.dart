/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Content attribute of template element is read-only.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test('Test empty template', () {
    var doc = newHtmlDocument();
    var template = doc.createElement('template');
    Expect.throws(() => template.content = null);
  });

  test('Test not empty template populated by innerHTML', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml = '<template>Text<div>DIV</div></template>';
    var template = doc.querySelector('template');
    Expect.throws(() => template.content = null);
  });

  test('Test that custom content attribute named "content" does not '
       'affect content IDL attribute', () {
    var doc = newHtmlDocument();
    doc.body.innerHtml = '<template id="template1" content="<div id=div1>'
      'Div content</div>"></template>';

    var template = doc.querySelector('#template1');
    Expect.throws(() => template.content = null);
    Expect.listEquals([],template.content.childNodes);
  });
}
