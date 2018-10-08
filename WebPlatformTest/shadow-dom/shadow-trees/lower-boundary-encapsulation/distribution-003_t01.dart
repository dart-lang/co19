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
 * @assertion Lower-boundary encapsulation:
 * The distribution does not affect the state of the document tree or shadow
 * trees
 */

import 'dart:html';
import '../../testcommon.dart';

main() {
  var shadowHost = document.createElement('ul');
  shadowHost.setInnerHtml(
      '<li class="first">host 1</li>' +
      '<li class="second">host 2</li>',
      treeSanitizer: new NullTreeSanitizer());
  shadowHost.style.visibility = 'hidden';
  document.body.append(shadowHost);
  var host1 = shadowHost.querySelector('.first');
  var host2 = shadowHost.querySelector('.second');

  var shadowRoot = shadowHost.createShadowRoot();
  shadowRoot.setInnerHtml(
      '<li class="first">shadow 1</li>' +
      '<content select=".second"></content>' +
      '<li class="second">shadow 2</li>',
      treeSanitizer: new NullTreeSanitizer());
  var shadow1 = shadowRoot.querySelector('.first');
  var shadow2 = shadowRoot.querySelector('.second');
  var content = shadowRoot.querySelector('content');

  assert_equals(host1.text, 'host 1');
  assert_equals(host2.text, 'host 2');
  assert_equals(shadow1.text, 'shadow 1');
  assert_equals(shadow2.text, 'shadow 2');
  assert_equals(content.text, '');

  assert_equals(shadowHost.children.length, 2);
  assert_equals(shadowHost.children[0], host1);
  assert_equals(shadowHost.children[1], host2);
  assert_equals(shadowRoot.children.length, 3);
  assert_equals(shadowRoot.children[0], shadow1);
  assert_equals(shadowRoot.children[1], content);
  assert_equals(shadowRoot.children[2], shadow2);

  assert_equals(host1.tagName, 'LI');
  assert_equals(shadow1.tagName, 'LI');
  assert_equals(content.tagName, 'CONTENT');
}
