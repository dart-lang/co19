/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a :nth-last-of-type() pseudo-class selector
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
  subdiv1.setInnerHtml('<ul><content select=":nth-last-of-type(2)"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //li6 should be invisible, all others visible
  Expect.isTrue(d.querySelector('#li1').offsetTop > 0,
      'Point 1: element should match :nth-last-of-type(2) pseudo-class selector');
  Expect.isTrue(d.querySelector('#li2').offsetTop > 0,
      'Point 2: element should match :nth-last-of-type(2) pseudo-class selector');
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0,
      'Point 3: element should match :nth-last-of-type(2) pseudo-class selector');
  Expect.isTrue(d.querySelector('#li4').offsetTop > 0,
      'Point 4: element should match :nth-last-of-type(2) pseudo-class selector');
  Expect.isTrue(d.querySelector('#li5').offsetTop > 0,
      'Point 5: element should match :nth-last-of-type(2) pseudo-class selector');
  Expect.equals(0, d.querySelector('#li6').offsetTop,
      'Element shouldn\'t match :nth-last-of-type(2) pseudo-class selector');
}
