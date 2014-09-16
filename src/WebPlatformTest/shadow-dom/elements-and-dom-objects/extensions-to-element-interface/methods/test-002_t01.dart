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
 * @assertion Extensions to Element Interface: createShadowRoot method
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  var d = document;

  var host = d.createElement('div');
  d.body.append(host);

  var span = d.createElement('span');
  span.innerHtml = 'Some text';
  host.append(span);

  var s = host.createShadowRoot();

  // span should become invisible as shadow root content
  assert_equals(span.offsetTop, 0, 'createShadowRoot() method should establish ' +
      'the context object as the shadow host of the ShadowRoot object');
}
