/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Upper-boundary encapsulation:
 * The parentNode and parentElement attributes of the shadow root object must
 * always return null.
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import '../../testcommon.dart';

main() {
  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var shadowRoot = doc.body.createShadowRoot();
    assert_equals(shadowRoot.parentNode, null);
  }, 'The parentNode attribute of a shadow root must always return null.');

  test(() {
    var doc = document.implementation.createHtmlDocument('Test');
    var outerShadowRoot = doc.body.createShadowRoot();
    var div = doc.createElement('div');
    outerShadowRoot.append(div);
    var innerShadowRoot = div.createShadowRoot();
    assert_equals(innerShadowRoot.parentNode, null);
  },
  'The parentNode attribute of a shadow root must always return null, ' +
  'even if the shadow root is nested inside another shadow root.'
  );
}
