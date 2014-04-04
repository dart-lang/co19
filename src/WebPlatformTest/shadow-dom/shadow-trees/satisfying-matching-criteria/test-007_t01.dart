/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a :target pseudo-class selector
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
  subdiv1.setInnerHtml('<content select=":target"></content>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //link10 should be visible, link11 not
  Expect.isTrue(d.querySelector('#link10').offsetTop > 0,
      'Element should match :target pseudo-class selector');
  Expect.equals(0, d.querySelector('#link11').offsetTop,
      'Element shouldn\'t match :target pseudo-class selector');
}
