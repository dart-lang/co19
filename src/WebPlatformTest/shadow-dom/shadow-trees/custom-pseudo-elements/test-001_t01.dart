/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Custom Pseudo-Elements: test valid pseudo-element
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
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
  thumb.setInnerHtml('This is a pseudo-element',
      treeSanitizer: new NullTreeSanitizer());
  //FIXME test works if prefixed version of API used.
  //In other words works if webkitPseudo property is used
  //thumb.webkitPseudo = 'x-thumb';
  thumb.pseudo = 'x-thumb';
  s.append(thumb);

  var height = thumb.offsetHeight;

  Expect.isTrue(height > 0, 'Element should be rendered');

  style = new Element.html('''
    <style>
      div::x-thumb {
        font-size: 30px;
      }
    </style>''',
    treeSanitizer: new NullTreeSanitizer());
  d.body.append(style);

  Expect.isTrue(thumb.offsetHeight > height, 'Pseudo-element style should be applied');
}

