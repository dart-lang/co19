/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain an universal selector
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

  // TODO add tests for namespace universal selector ns|*
  subdiv1.setInnerHtml('<ul><content select="*"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //The order of DOM elements should be the following:
  // li1-li6 should be visible and located on-order
  Expect.isTrue(d.querySelector('#li1').offsetTop < d.querySelector('#li2').offsetTop,
      'Point 1: Elements that mach insertion point criteria don\'t participate in distribution');
  Expect.isTrue(d.querySelector('#li2').offsetTop < d.querySelector('#li3').offsetTop,
      'Point 2: Elements that mach insertion point criteria don\'t participate in distribution');
  Expect.isTrue(d.querySelector('#li3').offsetTop < d.querySelector('#li4').offsetTop,
      'Point 3: Elements that mach insertion point criteria don\'t participate in distribution');
  Expect.isTrue(d.querySelector('#li4').offsetTop < d.querySelector('#li5').offsetTop,
      'Point 4: Elements that mach insertion point criteria don\'t participate in distribution');
  Expect.isTrue(d.querySelector('#li5').offsetTop < d.querySelector('#li6').offsetTop,
      'Point 5: Elements that mach insertion point criteria don\'t participate in distribution');
}
