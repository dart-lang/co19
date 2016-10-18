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
 * @assertion If parser in 'in head' insertion mode meets template end tag and
 * if the stack of open elements has no template element in html scope, then
 * this is a parse error; ignore the token
 */

import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();

    doc.head.setInnerHtml('</template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.head.childNodes.length, 0, 'Element must be ignored');

  }, '</template> tag in HTML head without start one should be ignored');



  test(() {
    var doc = newHTMLDocument();

    doc.head.setInnerHtml('<template id="tmpl"></template></template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.head.childNodes.length, 1, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Element should present it document head');

  }, '</template> tag in HTML head without start one should be ignored. '
  + 'Test valid <template> element and </template> tag after it');



  test(() {
    var doc = newHTMLDocument();

    doc.head.setInnerHtml('</template><template id="tmpl"></template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.head.childNodes.length, 1, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Element should present it document head');

  }, '</template> tag in HTML head without start one should be ignored. '
  + 'Test valid <template> element and </template> tag before it');



  test(() {
    var doc = newHTMLDocument();

    doc.head.setInnerHtml('</template><template id="tmpl"></template><title></title>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.head.childNodes.length, 2, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Valid element should present it document head');
    assert_not_equals(doc.querySelector('title'), null,
      'Valid title element should present it document head');

  }, '</template> tag in HTML head without start one should be ignored. '
  + 'Test valid <template> element, <title> element and </template> tag before them');



  test(() {
    var doc = newHTMLDocument();

    doc.head.setInnerHtml('<template id="tmpl"></template><title></title></template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.head.childNodes.length, 2, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Valid element should present it document head');
    assert_not_equals(doc.querySelector('title'), null,
      'Valid title element should present it document head');

  }, '</template> tag in HTML head without start one should be ignored. '
  + 'Test valid <template> element, <title> element and </template> tag after them');
}
