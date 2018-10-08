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
 * @assertion Even if template's enclosing document has no browsing context,
 * it gets its own template contents owner
 */

import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    doc.body.append(template);

    assert_not_equals(template.content.ownerDocument, doc,
        'Wrong template content owner');

  }, 'Test the template contents owner document when enclosing document has '
  + 'no browsing content. Template element is created by createElement()');



  test(() {
    var doc = newHTMLDocument();

    doc.body.innerHtml = '<template><div>some text</div></template>';

    var template = doc.querySelector('template');

    assert_not_equals(template.content.ownerDocument, doc,
        'Wrong template content owner');

  }, 'Test the template contents owner document when enclosing document has '
  + 'no browsing content. Template element is created by innerHtml');
}
