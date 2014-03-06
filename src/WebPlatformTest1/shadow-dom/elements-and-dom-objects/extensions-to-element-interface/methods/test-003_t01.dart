/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
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
  span.setAttribute('id', 'sp0');
  span.innerHtml = 'Some text';
  host.append(span);

  //old tree
  var s1 = host.createShadowRoot();
  s1.innerHtml = '<span id="sp1">Span 1</span>';
  //young tree
  var s2 = host.createShadowRoot();
  s2.innerHtml = '<span id="sp2">Span 2</span>';

  // span should become invisible as shadow root content
  assert_equals(span.offsetTop, 0, 'Point 1:createShadowRoot() method should add ' +
      'the ShadowRoot object at the top of the tree stack of its host');
  assert_equals(s1.querySelector('#sp1').offsetTop, 0, 'Point 2:createShadowRoot() method should add ' +
      'the ShadowRoot object at the top of the tree stack of its host');
  assert_true(s2.querySelector('#sp2').offsetTop > 0, 'Point 3:createShadowRoot() method should add ' +
      'the ShadowRoot object at the top of the tree stack of its host');
}
