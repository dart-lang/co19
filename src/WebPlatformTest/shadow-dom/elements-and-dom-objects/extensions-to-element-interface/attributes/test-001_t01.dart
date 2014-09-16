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
 * pseudo of type DOMString attribute. Test getter when there is a custom 
 * pseudo-element associated with this element
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  var d = newHTMLDocument();

  var widget = d.createElement('div');
  d.body.append(widget);

  var s = createSR(widget);

  var thumb = d.createElement('span');
  thumb.innerHtml = 'This is a pseudo-element';
  thumb.pseudo = 'x-thumb';
  s.append(thumb);

  var style = new Element.html('''
      <style>
      div::x-thumb {
        font-size: 30px;
      };
      </style>''',
      treeSanitizer: new NullTreeSanitizer());
  d.body.append(style);

  assert_true(thumb.pseudo != null, 'attribute \'pseudo\' must not be null');

  assert_equals(thumb.pseudo, 'x-thumb', 'attribute \'pseudo\' must return ' +
      'the current custom pseudo-element value');
}
