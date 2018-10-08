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
 * @assertion Event Retargeting: Event retargeting for document nodes 
 * distributed among insertion points
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
  var div = document.createElement('div');
  div.setInnerHtml('<ul id="ip_wrapper"><content select=".shadow"></content></ul>',
      treeSanitizer: new NullTreeSanitizer());
  s.append(div);

  asyncStart();

  d.body.addEventListener('click', (dynamic event) {
    assert_equals(event.target.tagName, 'UL', 'Information about event target crossing ' +
      'the shadow boundaries should be adjusted for document nodes distributed' +
      'among insertion points');
    asyncEnd();
  }, false);

  var event = new Event("click", canBubble:true, cancelable:false);
  d.querySelector('#li3').dispatchEvent(event);
}
