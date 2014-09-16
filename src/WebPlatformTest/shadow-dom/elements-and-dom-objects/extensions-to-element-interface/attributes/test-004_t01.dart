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
 * @assertion Extensions to Element Interface:
 * pseudo of type DOMString attribute; Test setter
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = document;

    var style = new Element.html('''
      <style>
      span {
        font-size: 10px;
      }
      </style>''',
      treeSanitizer: new NullTreeSanitizer());
    d.head.append(style);

    var widget = d.createElement('div');
    d.body.append(widget);

    var s = createSR(widget);

    var thumb = d.createElement('span');
    thumb.innerHtml = 'This is a pseudo-element';

    thumb.pseudo = 'x-thumb';
    s.append(thumb);

    var height = thumb.offsetHeight;

    assert_true(height > 0, 'Element should be rendered');

    style = new Element.html('''
        <style>
        div::x-thumb {
          font-size: 30px;
        };
        </style>''',
        treeSanitizer: new NullTreeSanitizer());
    d.body.append(style);

    assert_true(thumb.offsetHeight > height, 'Pseudo-element style should be applied');
    thumb.pseudo = null;

    assert_equals(thumb.offsetHeight, height, 'Pseudo-element style should be discarded by new setter');

  }, 'A_10_02_01_04_T01');

  test(() {
    var d = document;

    var widget = d.createElement('div');
    d.body.append(widget);

    var s = createSR(widget);

    var thumb = d.createElement('span');
    thumb.innerHtml = 'This is a pseudo-element';

    thumb.pseudo = 'x-thumb';
    s.append(thumb);

    assert_equals(thumb.pseudo,  'x-thumb', 'Pseudo-element style attribute should be set');
    thumb.pseudo = 'x-thumb2';

    assert_equals(thumb.pseudo, 'x-thumb2', 'New pseudo-element style should be set by setter');

  }, 'A_10_02_01_04_T02');
}
