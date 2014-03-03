/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a :checked pseudo-class selector
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var div = d.querySelector('#inputs-wrapper');
  var s = createSR(div);

  //make shadow subtree
  var subdiv1 = document.createElement('div');
  subdiv1.setInnerHtml('<content select=":checked"></content>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //chb1 should be visible, chb2 not
  Expect.isTrue(d.querySelector('#chb1').offsetTop > 0,
      'Element should match :checked pseudo-class selector');
  Expect.equals(0, d.querySelector('#chb2').offsetTop,
      'Element shouldn\'t match :checked pseudo-class selector');
}

