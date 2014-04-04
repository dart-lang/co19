/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The following events must always be stopped at the nearest 
 * shadow boundary: abort, error, select, change, load, reset, resize, scroll,
 * selectstart
 */

import 'dart:html';
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import '../../testcommon.dart';

main() {
  var d = document;

  var host = d.createElement('div');
  host.setAttribute('style', 'height:50%; width:100%');
  host.setAttribute('id', 'host');
  d.body.append(host);

  //Shadow root to play with
  var s = createSR(host);

  var inp1 = d.createElement('input');
  inp1.setAttribute('id', 'inp1');
  inp1.setAttribute('type', 'checkbox');
  s.append(inp1);

  asyncStart();

  s.addEventListener('abort', (event) {
    assert_equals(event.target.getAttribute('id'), 'inp1', 'Inside shadoe tree: Wrong target');
    asyncEnd();
  }, false);

  d.body.addEventListener('abort', (event) {
    assert_true(false, 'abort event should always be stopped at Shadow boundary');
  }, false);

  var event = new Event("abort", canBubble:true, cancelable:false);
  inp1.dispatchEvent(event);
}
