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
 * @assertion innerHtml of template element replaces all referenced by the
 * content attribute
 */

import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');

    var div1 = doc.createElement('div');
    div1.setAttribute('id', 'div1');
    template.content.append(div1);

    assert_not_equals(template.content.querySelector('#div1'), null,
      'Element should present in template content');

    template.innerHtml = '<div id="div2"></div>';

    assert_equals(template.content.querySelector('#div1'), null,
      'Template content should be replaced by innerHtml');
    assert_not_equals(template.content.querySelector('#div2'), null,
      'Element should present in template content');

  }, 'innerHtml of template element replaces all referenced by the content attribute');



  test(() {
    var doc = newHTMLDocument();
    var template = doc.createElement('template');
    var nestedTemplate = doc.createElement('template');

    template.content.append(nestedTemplate);

    var div1 = doc.createElement('div');
    div1.setAttribute('id', 'div1');
    nestedTemplate.content.append(div1);

    assert_not_equals(nestedTemplate.content.querySelector('#div1'), null,
      'Element should present in template content');

    nestedTemplate.innerHtml = '<div id="div2"></div>';

    assert_equals(nestedTemplate.content.querySelector('#div1'), null,
      'Template content should be replaced by innerHtml');
    assert_not_equals(nestedTemplate.content.querySelector('#div2'), null,
      'Element should present in template content');

  }, 'innerHtml of template element replaces all referenced by the content attribute. '
  + 'Test nested template');

}
