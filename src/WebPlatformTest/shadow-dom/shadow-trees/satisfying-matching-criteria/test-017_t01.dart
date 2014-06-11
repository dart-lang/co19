/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a :last-child pseudo-class selector
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var ul = d.querySelector('ul.stories');
  var s = createSR(ul);

  //make shadow subtree
  var subdiv1 = document.createElement('div');
  // :last-child pseudo-element no longer supported see
  // http://w3c.github.io/webcomponents/spec/shadow/#satisfying-matching-criteria
  subdiv1.setInnerHtml('<ul><content select="#li6"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //li6 should be visible, all other not
  Expect.isTrue(d.querySelector('#li6').offsetTop > 0,
      'Element should match :last-child pseudo-class selector');
  Expect.equals(0, d.querySelector('#li1').offsetTop,
      'Point 1: element shouldn\'t match :last-child pseudo-class selector');
  Expect.equals(0, d.querySelector('#li2').offsetTop,
      'Point 2: element shouldn\'t match :last-child pseudo-class selector');
  Expect.equals(0, d.querySelector('#li3').offsetTop,
      'Point 3: element shouldn\'t match :last-child pseudo-class selector');
  Expect.equals(0, d.querySelector('#li4').offsetTop,
      'Point 4: element shouldn\'t match :last-child pseudo-class selector');
  Expect.equals(0, d.querySelector('#li5').offsetTop,
      'Point 5: element shouldn\'t match :last-child pseudo-class selector');
}
