/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a :nth-child() pseudo-class selector
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
  subdiv1.setInnerHtml('<ul><content select=":nth-child(odd)"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //li1, li3, li5 should be visible, li2, li4, li6 not
  Expect.isTrue(d.querySelector('#li1').offsetTop > 0,
      '1-st element should match :nth-child(odd) pseudo-class selector');
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0,
      '3-rd element should match :nth-child(odd) pseudo-class selector');
  Expect.isTrue(d.querySelector('#li5').offsetTop > 0,
      '5-th element should match :nth-child(odd) pseudo-class selector');
  Expect.equals(0, d.querySelector('#li2').offsetTop,
      '2-nd element shouldn\'t match :nth-child() pseudo-class selector');
  Expect.equals(0, d.querySelector('#li4').offsetTop,
      '4-th element shouldn\'t match :nth-child() pseudo-class selector');
  Expect.equals(0, d.querySelector('#li6').offsetTop,
      '6-nd element shouldn\'t match :nth-child() pseudo-class selector');
}
