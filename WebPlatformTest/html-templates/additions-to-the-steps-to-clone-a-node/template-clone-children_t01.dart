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
 * @assertion Clone template node: all the children of template content are
 * copied if 'copy children flag' set to true.
 */

import '../testcommon.dart';

main() {
  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');
  var copy = template.clone(true);

  assert_not_equals(copy.content, null,
      'Template clone content attribute should not be null');

  assert_equals(copy.content.childNodes.length, 2,
    'Wrong number of template content\'s copy child nodes');
  assert_not_equals(copy.content.querySelector('#div1'), null,
    'Template child node should be copied');
  assert_not_equals(copy.content.querySelector('#div2'), null,
    'Template child node should be copied');

  }, 'Clone template node. Test call to clone(true)');



  test(() {
    var doc = newHTMLDocument();
    doc.body.innerHtml = '<template id="tmpl1">' +
    '<div id="div1">This is div inside template</div>' +
    '<div id="div2">This is another div inside template</div>' +
    '</template>';

  var template = doc.querySelector('#tmpl1');
  var copy = template.clone(false);

  assert_not_equals(copy.content, null,
      'Template clone content attribute is null');

  assert_equals(copy.content.childNodes.length, 0,
    'Wrong number of template content\'s copy child nodes');

  }, 'Clone template node. Test call to clone(false)');
}
