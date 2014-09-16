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
 * @assertion template contents should be serialized instead of template 
 * element if serializing template element
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerHtml = 'some text';
    template.content.append(div);

    assert_equals(template.outerHtml, '<template><div id="div1">some text</div></template>',
      'template element is serialized incorrectly');

  }, 'Template contents should be serialized instead of template element if serializing template element');



  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');
    var nestedTemplate = doc.createElement('template');

    template.content.append(nestedTemplate);

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerHtml = 'some text';
    nestedTemplate.content.append(div);

    assert_equals(template.outerHtml, '<template><template><div id="div1">some text</div></template></template>',
      'template element is serialized incorrectly');


  }, 'Template contents should be serialized instead of template element if serializing template element. '
  + 'Test nested template');


  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    var div = doc.createElement('div');
    div.setAttribute('id', 'div1');
    div.innerHtml = 'some text';
    template.content.append(div);
    doc.body.append(template);

    assert_equals(doc.documentElement.outerHtml, '<html><head><title>Test Document</title></head><body><template><div id="div1">some text</div></template></body></html>',
      'template element is serialized incorrectly');

  }, 'Template contents should be serialized instead of template element if serializing template element. '
  + 'Test serializing whole document');
}
