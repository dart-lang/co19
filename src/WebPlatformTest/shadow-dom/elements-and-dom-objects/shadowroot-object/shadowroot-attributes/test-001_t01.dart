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
 * @assertion ShadowRoot Object: attribute bool applyAuthorStyles attribute.
 * If false, the author styles are not applied to the shadow tree
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  //test default value
  test(() {
    var d = document;

    var style = new Element.html('<style>' +
      '.invis {' +
        'display:none;' +
      '}' +
      '</style>',
        treeSanitizer: new NullTreeSanitizer());
    d.head.append(style);

    var host = d.createElement('div');
    d.body.append(host);

    //Shadow root to play with
    var s = createSR(host);

    assert_false(s.applyAuthorStyles, 'Default value for ShadowRoot Object attribute applyAuthorStyles is expected to be false');


    var div1 = d.createElement('div');
    div1.innerHtml ='<span id="shd" class="invis">This is the shadow tree</span>';
    s.append(div1);

    //apply-author-styles flag is false by default. Invisible style shouldn't be applied
    assert_true(s.querySelector('#shd').offsetTop > 0,
        'CSS styles declared in enclosing tree must not be applied in a shadow tree ' +
        'if the apply-author-styles flag is set to false');

  }, 'A_10_01_01_01_01_T01');

  //test implicit value
  test(() {
    var d = document;

    var style = new Element.html('<style>' +
      '.invis {' +
        'display:none;' +
      '}' +
      '</style>',
        treeSanitizer: new NullTreeSanitizer());
    d.head.append(style);

    var host = d.createElement('div');
    d.body.append(host);

    //Shadow root to play with
    var s = createSR(host);
    s.applyAuthorStyles = false;

    var div1 = d.createElement('div');
    div1.innerHtml ='<span id="shd" class="invis">This is the shadow tree</span>';
    s.append(div1);

    //apply-author-styles flag is set to false. Invisible style shouldn't be applied
    assert_true(s.querySelector('#shd').offsetTop > 0,
        'CSS styles declared in enclosing tree must not be applied in a shadow tree ' +
        'if the apply-author-styles flag is set to false');

  }, 'A_10_01_01_01_01_T02');
}
