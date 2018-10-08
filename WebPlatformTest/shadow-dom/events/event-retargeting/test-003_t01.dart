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
 * @assertion Event Retargeting: Event retargeting for fallback content
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  var d = document;

  d.body.setInnerHtml('' +
    '<div id="main">' +
            '<div id="shadow-root">' +
                    '<span>1</span>' +
                    '<span>2</span>' +
                    '<span>3</span>' +
        '</div>' +
    '</div>',
    treeSanitizer: new NullTreeSanitizer());

  var ul = d.querySelector('#shadow-root');
  var s = createSR(ul);

  //make shadow subtree
  var div = document.createElement('div');
  div.setInnerHtml( '<content select=".shadow"><span id="flbk">Fallback item</span></content>',
    treeSanitizer: new NullTreeSanitizer());
  s.append(div);

  asyncStart();

  d.body.addEventListener('click', (dynamic event) {
    assert_equals(event.target.getAttribute('id'), 'shadow-root', 'Information about ' +
      'event target crossing the shadow boundaries should be adjusted for the fallback ' +
      'content');
    asyncEnd();
  }, false);

  var event = new Event("click", canBubble:true, cancelable:false);
  s.querySelector('#flbk').dispatchEvent(event);
}
