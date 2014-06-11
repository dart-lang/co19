/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a :link pseudo-class selector
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var div = d.querySelector('#links-wrapper');
  var s = createSR(div);

  //make shadow subtree
  var subdiv1 = document.createElement('div');
  // show all links instead of all unvisited links pseudo-class :link isn't
  // allowed as a selector in the Shadow DOM content.
  subdiv1.setInnerHtml('<content select="a"></content>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //All links elements should be visible
  Expect.isTrue(d.querySelector('#link10').offsetTop > 0,
      'Point 1: <a> tag should match :link pseudo-class selector');
  Expect.isTrue(d.querySelector('#link11').offsetTop > 0,
      'Point 2: <a> tag should match :link pseudo-class selector');
}
