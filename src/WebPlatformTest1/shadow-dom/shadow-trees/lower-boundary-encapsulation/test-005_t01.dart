/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Lower-boundary encapsulation:
 * An insertion point may be active or inactive. An active insertion point
 * participates in the distribution process, whereas the inactive insertion
 * does not
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var ul = d.querySelector("ul.stories");
  var s = createSR(ul);

  //make shadow subtree
  var subdiv1 = document.createElement('div');
  subdiv1.setInnerHtml(
      "<ul><content select='.nobody'><span id='shadowspan'>Inactive insertion point</span></content></ul>",
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  assert_true(s.querySelector('#shadowspan').offsetTop > 0,
      'Inactive insertion point should be in a fallback content');

  // All li1-li6 should be invisible, shadowspan visible
  assert_equals(d.querySelector('#li1').offsetTop, 0,
      'Point 1: Elements that don\'t mach insertion point criteria participate in distribution');
  assert_equals(d.querySelector('#li2').offsetTop, 0,
      'Point 2: Elements that don\'t mach insertion point criteria participate in distribution');
  assert_equals(d.querySelector('#li3').offsetTop, 0,
      'Point 3: Elements that don\'t mach insertion point criteria participate in distribution');
  assert_equals(d.querySelector('#li4').offsetTop, 0,
      'Point 4: Elements that don\'t mach insertion point criteria participate in distribution');
  assert_equals(d.querySelector('#li5').offsetTop, 0,
      'Point 5: Elements that don\'t mach insertion point criteria participate in distribution');
  assert_equals(d.querySelector('#li6').offsetTop, 0,
      'Point 6: Elements that don\'t mach insertion point criteria participate in distribution');
}
