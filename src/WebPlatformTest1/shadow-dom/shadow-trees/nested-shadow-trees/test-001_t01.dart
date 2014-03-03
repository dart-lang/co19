/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Nested Shadow Subtrees:
 * Any element in a shadow tree can be a shadow host, thus producing nested
 * shadow trees
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  equals(actual,expected,reason) => Expect.equals(expected,actual,reason);

  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var ul = d.querySelector('ul.stories');

  //make a shadow subtree
  var s1 = createSR(ul);
  var subdiv1 = d.createElement('div');
  subdiv1.setInnerHtml('<ul><content select=".shadow"></content></ul>' +
      '<div id="host_div">' +
              '<span id="sh_span">This span should be visible</span>' +
              '<ul id="host">' +
                      '<li id="sh_li1">Shadow li 1</li>' +
                      '<li id="sh_li2">Shadow li 2</li>' +
                      '<li id="sh_li3" class="shadow2">Shadow li 3</li>' +
                      '<li id="sh_li4">Shadow li 4</li>' +
                      '<li id="sh_li5">Shadow li 5</li>' +
              '</ul>' +
      '</div>',
      treeSanitizer: new NullTreeSanitizer());
  s1.append(subdiv1);

  //make nested shadow subtree
  var sh_ul = s1.querySelector('#host');
  var s2 = createSR(sh_ul);
  var subdiv2 = d.createElement('div');
  subdiv2.setInnerHtml('<ul><content select=".shadow2"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s2.append(subdiv2);

  //The order of DOM elements should be the following:
  //li4, li3 and sh_li3 visible. Other elements invisible
  Expect.isTrue(d.querySelector('#li3').offsetTop > 0,
      'Point 1: Shadow tree should take part in the distribution');
  Expect.isTrue(d.querySelector('#li6').offsetTop > d.querySelector('#li3').offsetTop,
      'Point 2: Shadow tree should take part in the distribution');
  Expect.isTrue(s1.querySelector('#sh_li3').offsetTop > 0,
      'Nested shadow subtree should take part in the distribution');

  equals(d.querySelector('#li1').offsetTop, 0,
      'Point 3: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li2').offsetTop, 0,
      'Point 4: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li4').offsetTop, 0,
      'Point 5: Elements that don\'t mach insertion point criteria participate in distribution');
  equals(d.querySelector('#li5').offsetTop, 0,
      'Point 6: Elements that don\'t mach insertion point criteria participate in distribution');

  equals(s1.querySelector('#sh_li1').offsetTop, 0,
      'Point 7: Elements of the nested shadow subtree that don\'t mach insertion point criteria participate in distribution');
  equals(s1.querySelector('#sh_li2').offsetTop, 0,
      'Point 8: Elements of the nested shadow subtree that don\'t mach insertion point criteria participate in distribution');
  equals(s1.querySelector('#sh_li4').offsetTop, 0,
      'Point 9: Elements of the nested shadow subtree that don\'t mach insertion point criteria participate in distribution');
  equals(s1.querySelector('#sh_li5').offsetTop, 0,
      'Point 10: Elements of the nested shadow subtree that don\'t mach insertion point criteria participate in distribution');

  Expect.isTrue(s1.querySelector('#sh_span').offsetTop > 0,
      'Shadow subtree elements that are not shadow host should take part in the distribution');
}
