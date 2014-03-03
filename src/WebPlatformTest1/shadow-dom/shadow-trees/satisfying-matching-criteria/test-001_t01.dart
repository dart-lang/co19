/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Matching Insertion Points:
 * A valid selector fragment may contain a type selector
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;
  d.body.setInnerHtml(bobs_page,
      treeSanitizer: new NullTreeSanitizer());

  var div = d.querySelector('#divid');
  var s = createSR(div);

  //make shadow subtree
  var subdiv1 = document.createElement('div');
  subdiv1.setInnerHtml('<content select="span"></content>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(subdiv1);

  //The order of DOM elements should be the following:
  // <ul class='stories'>, <span>. Invisible: <ul id="ul2">

  Expect.isTrue(d.querySelector('ul.stories').offsetTop < d.querySelector('#spandex').offsetTop,
      'A valid selector fragment may contain \'span\' type selector');

  Expect.equals(0, d.querySelector('#ul2').offsetTop,
      '<ul> element shouldn\'t match "span" type selector');
}
