/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that window.innerWidth/innerHeight does not include
 * the size of the scrollbars.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var width = window.innerWidth;
  var height = window.innerHeight;

  // Now force scroll bars. innerWidth and innerHeight should not take the scroll bar into account
  document.body.style.overflow = 'scroll';
  document.body.offsetTop;

  debug('width');
  shouldBe(width, window.innerWidth);

  debug('height');
  shouldBe(height, window.innerHeight);
}
