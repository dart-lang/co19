/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Hosting Multiple Shadow Subtrees:
 * When an insertion point or a shadow insertion point has nothing 
 * assigned or distributed to them, the fallback content must be used instead
 * when rendering
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var ul = d.querySelector('ul.stories');

  //make the oldest shadow subtree
  var s1 = createSR(ul);
  var subdiv1 = d.createElement('div');
  subdiv1.setInnerHtml('<ul><content select="#li1"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s1.append(subdiv1);

  //make an old shadow subtree
  var s2 = createSR(ul);
  var subdiv2 = d.createElement('div');
  subdiv2.setInnerHtml('<ul><content select=".shadow"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s2.append(subdiv2);

  //make the youngest shadow subtree
  var s3 = createSR(ul);
  var subdiv3 = d.createElement('div');
  subdiv3.setInnerHtml('<ul><content select=".shadow2"></content></ul>' +
    '<shadow><span id="spn_first">The first span</span></shadow>' +
    '<shadow><span id="spn_second">The second span</span></shadow>',
      treeSanitizer: new NullTreeSanitizer());

  s3.append(subdiv3);

  //The order of DOM elements should be the following:
  //li4, li3, li6 visible. Other elements invisible
  Expect.isTrue(d.querySelector('#li4').offsetTop > 0,
      'Only the younger tree should take part in the distribution');
  Expect.isTrue(d.querySelector('#li3').offsetTop > d.querySelector('#li4').offsetTop,
      'Point 1: Older tree should take part in the distribution');
  Expect.isTrue(d.querySelector('#li6').offsetTop > d.querySelector('#li3').offsetTop,
      'Point 2: Older tree should take part in the distribution');

  Expect.equals(0, d.querySelector('#li1').offsetTop,
      'The oldest tree shouldn\'t take part in the distribution');
  Expect.equals(0, d.querySelector('#li2').offsetTop,
      'Point 3: Elements that don\'t mach insertion point criteria participate in distribution');
  Expect.equals(0, d.querySelector('#li5').offsetTop,
      'Point 4: Elements that don\'t mach insertion point criteria participate in distribution');

  //spn_first should be invisible, spn_second visible
  Expect.equals(0, s3.querySelector('#spn_first').offsetTop,
      'Shadow insertion point should be active');
  Expect.isTrue(s3.querySelector('#spn_second').offsetTop > 0,
      'Shadow insertion point should be inactive');
}
