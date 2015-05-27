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
 * @assertion If parser in 'in body' insertion mode meets template end tag and
 * if the stack of open elements has no template element in html scope, then
 * this is a parse error; ignore the token
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();

    doc.body.setInnerHtml('</template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.body.childNodes.length, 0, 'Element must be ignored');

  }, '</template> tag in HTML body without start one should be ignored');



  test(() {
    var doc = newHTMLDocument();

    doc.body.setInnerHtml('<template id="tmpl"></template></template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.body.childNodes.length, 1, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Element should present it document body');

  }, '</template> tag in HTML body without start one should be ignored. '
  + 'Test valid <template> element and </template> tag after it');



  test(() {
    var doc = newHTMLDocument();

    doc.body.setInnerHtml('</template><template id="tmpl"></template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.body.childNodes.length, 1, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Element should present it document body');

  }, '</template> tag in HTML body without start one should be ignored. '
  + 'Test valid <template> element and </template> tag before it');



  test(() {
    var doc = newHTMLDocument();

    doc.body.setInnerHtml('</template><template id="tmpl"></template><title></title>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.body.childNodes.length, 2, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Valid element should present it document body');
    assert_not_equals(doc.querySelector('title'), null,
      'Valid title element should present it document body');

  }, '</template> tag in HTML body without start one should be ignored. '
  + 'Test valid <template> element, <title> element and </template> tag before them');



  test(() {
    var doc = newHTMLDocument();

    doc.body.setInnerHtml('<template id="tmpl"></template><title></title></template>',
      treeSanitizer: new NullTreeSanitizer());

    assert_equals(doc.body.childNodes.length, 2, 'Element must be ignored');
    assert_not_equals(doc.querySelector('#tmpl'), null,
      'Valid element should present it document body');
    assert_not_equals(doc.querySelector('title'), null,
      'Valid title element should present it document body');

  }, '</template> tag in HTML body without start one should be ignored. '
  + 'Test valid <template> element, <title> element and </template> tag after them');
}
