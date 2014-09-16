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
 * @assertion The shadow HTML element: shadow insertion point
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {

    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    //old tree
    var s1 = createSR(host);
    s1.innerHtml = '<span id="sp1">This is an old tree</span>';
    //young tree
    var s2 = createSR(host);

    var div = d.createElement('div');
    div.setInnerHtml(
      '<span id="spandex">This is a shadow root content</span>' +
      '<shadow><span id="shadowId">This is a shadow fallback content</span></shadow>',
      treeSanitizer: new NullTreeSanitizer());
    s2.append(div);

    assert_equals(s2.querySelector('#shadowId').offsetTop, 0, 'Fallback content should not be rendered');
    assert_true(s1.querySelector('#sp1').offsetTop > 0, 'Old tree should be rendered');
    assert_true(s2.querySelector('#spandex').offsetTop > 0, 'Element should be rendered');

  }, 'A_10_05_02_T01');
}
