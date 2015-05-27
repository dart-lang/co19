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
 * @assertion The content HTML element: getDistributedNodes method
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {

    var d = document;

    d.body.innerHtml =
      '<ul class="cls">' +
        '<li id="li1" class="shadow">1</li>' +
        '<li id="li2" class="shadow2">2</li>' +
        '<li id="li3" class="shadow">3</li>' +
        '<li id="li4">4</li>' +
        '<li id="li5" class="shadow">5</li>' +
        '<li id="li6" class="shadow2">6</li>' +
      '</ul>';

  var host = d.querySelector('.cls');
  //Shadow root to play with
  var s = createSR(host);

  var div = d.createElement('div');
  div.setInnerHtml(
    '<ul><content id="contentId" select=".clazz"><span id="spandex">This is fallback content</span></content></ul>',
    treeSanitizer: new NullTreeSanitizer());
  s.append(div);

  assert_equals(s.querySelector('#contentId').getDistributedNodes().length, 0,
      'There should be no distributed nodes');

  }, 'A_10_04_06_T01');


  test(() {

    var d = document;

    d.body.innerHtml =
      '<ul class="cls">' +
        '<li id="li1" class="shadow">1</li>' +
        '<li id="li2" class="shadow2">2</li>' +
        '<li id="li3" class="shadow">3</li>' +
        '<li id="li4">4</li>' +
        '<li id="li5" class="shadow">5</li>' +
        '<li id="li6" class="shadow2">6</li>' +
      '</ul>';

  var host = d.querySelector('.cls');
  //Shadow root to play with
  var s = createSR(host);

  var div = d.createElement('div');
  div.setInnerHtml(
    '<ul><content id="contentId" select=".shadow"><span id="spandex">This is fallback content</span></content></ul>',
    treeSanitizer: new NullTreeSanitizer());
  s.append(div);

  assert_equals(s.querySelector('#contentId').getDistributedNodes().length, 3,
      'Wrond distributed nodes collection size');

  assert_equals(s.querySelector('#contentId').getDistributedNodes()[0].getAttribute('id'), 'li1',
      'Point 1: wrong element in distributed nodes collection');
  assert_equals(s.querySelector('#contentId').getDistributedNodes()[1].getAttribute('id'), 'li3',
      'Point 2: wrong element in distributed nodes collection');
  assert_equals(s.querySelector('#contentId').getDistributedNodes()[2].getAttribute('id'), 'li5',
      'Point 3: wrong element in distributed nodes collection');
  }, 'A_10_04_06_T02');
}
