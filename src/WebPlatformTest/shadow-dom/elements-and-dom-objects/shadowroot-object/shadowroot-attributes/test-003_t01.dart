/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ShadowRoot Object: 
 * attribute bool applyAuthorStyles attribute. Test setter and getter
 */

import 'dart:html';
import "../../../../../Utils/expect.dart";
import '../../../testcommon.dart';

main() {
  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    var s = createSR(host);
    s.applyAuthorStyles = true;

    assert_equals(s.applyAuthorStyles, true, 'attribute must return the current value of the ' +
      'apply-author-styles flag');

  }, 'A_10_01_01_01_03_T01');


  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    var s = createSR(host);
    s.applyAuthorStyles = false;

    assert_equals(s.applyAuthorStyles, false, 'attribute must return the current value of the ' +
      'apply-author-styles flag');

  }, 'A_10_01_01_01_03_T02');

  test(() {
    var d = document;

    var host = d.createElement('div');
    d.body.append(host);

    var s = createSR(host);

    assert_equals(s.applyAuthorStyles, false, 'attribute must the default value (false) of the ' +
      'apply-author-styles flag');

    s.applyAuthorStyles = true;

    assert_equals(s.applyAuthorStyles, true, 'attribute must return the current value of the ' +
      'apply-author-styles flag');

    s.applyAuthorStyles = false;

    assert_equals(s.applyAuthorStyles, false, 'attribute must change the value of the ' +
      'apply-author-styles flag');

  }, 'A_10_01_01_01_03_T03');
}
