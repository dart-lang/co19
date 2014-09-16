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
 * @assertion Hosting Multiple Shadow Subtrees:
 * If multiple shadow insertion points exist in a shadow DOM subtree, only the
 * first, in tree order, is recognized
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
  subdiv3.setInnerHtml('<ul><content select=".shadow2"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s3.append(subdiv3);

  //add a shadow insertion point for the old tree
  s3.append(d.createElement('shadow'));
  //add another shadow insertion point for the older tree.
  //Shouldn't match
  s3.append(d.createElement('shadow'));


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
}
