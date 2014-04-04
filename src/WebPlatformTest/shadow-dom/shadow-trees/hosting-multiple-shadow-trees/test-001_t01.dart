/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Hosting Multiple Shadow Subtrees:
 * The shadow insertion point designates a place in the shadow DOM subtree,
 * where an older tree is inserted when rendering
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  // Check that only the younger tree is visible if there's no shadow insertion point
  test(() {
    var d = document;
    d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

    var ul = d.querySelector('ul.stories');

    //make old shadow subtree
    var s1 = createSR(ul);
    var subdiv1 = d.createElement('div');
    subdiv1.setInnerHtml('<ul><content select=".shadow"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
    s1.append(subdiv1);

    //make younger shadow subtree
    var s2 = createSR(ul);
    var subdiv2 = d.createElement('div');
    subdiv2.setInnerHtml('<ul><content select=".shadow2"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
    s2.append(subdiv2);

    //The order of DOM elements should be the following:
    //li4 visible. Other elements invisible
    Expect.isTrue(d.querySelector('#li4').offsetTop > 0,
        'Only the younger tree should take part in the distribution');

    Expect.equals(0, d.querySelector('#li1').offsetTop,
        'Point 1: Elements that don\'t mach insertion point criteria participate in distribution');
    Expect.equals(0, d.querySelector('#li2').offsetTop,
        'Point 2: Elements that don\'t mach insertion point criteria participate in distribution');
    Expect.equals(0, d.querySelector('#li3').offsetTop,
        'Point 3: Elements that don\'t mach insertion point criteria participate in distribution');
    Expect.equals(0, d.querySelector('#li5').offsetTop,
        'Point 4: Elements that don\'t mach insertion point criteria participate in distribution');
    Expect.equals(0, d.querySelector('#li6').offsetTop,
        'Point 5: Elements that don\'t mach insertion point criteria participate in distribution');
  }, 'A_04_05_01_T1');

  //Check that both the younger tree and the older one are visible
  //if there's a shadow insertion point for the older tree
  test(() {
    var d = document;
    d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

    var ul = d.querySelector('ul.stories');

    //make old shadow subtree
    var s1 = createSR(ul);
    var subdiv1 = d.createElement('div');
    subdiv1.setInnerHtml('<ul><content select=".shadow"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
    s1.append(subdiv1);

    //make younger shadow subtree
    var s2 = createSR(ul);
    var subdiv2 = d.createElement('div');
    subdiv2.setInnerHtml('<ul><content select=".shadow2"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
    s2.append(subdiv2);

    //add a shadow insertion point for the older tree
    s2.append(d.createElement('shadow'));

    //The order of DOM elements should be the following:
    //li4, li3, li6 visible. Other elements invisible
    Expect.isTrue(d.querySelector('#li4').offsetTop > 0,
        'Younger tree should take part in the distribution');
    Expect.isTrue(d.querySelector('#li3').offsetTop > d.querySelector('#li4').offsetTop,
        'Point 1: Older tree should take part in the distribution');
    Expect.isTrue(d.querySelector('#li6').offsetTop > d.querySelector('#li3').offsetTop,
        'Point 2: Older tree should take part in the distribution');

    Expect.equals(0, d.querySelector('#li1').offsetTop,
        'Point 3: Elements that don\'t mach insertion point criteria participate in distribution');
    Expect.equals(0, d.querySelector('#li2').offsetTop,
        'Point 4: Elements that don\'t mach insertion point criteria participate in distribution');
    Expect.equals(0, d.querySelector('#li5').offsetTop,
        'Point 5: Elements that don\'t mach insertion point criteria participate in distribution');
  }, 'A_04_05_01_T2');
}
