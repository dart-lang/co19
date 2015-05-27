/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Setting a CSSStyleDeclaration after its element has been GCed
 * should not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var span = document.createElement('span');
  var style = span.style;
  span = null;
  gc();
  style.cssText = 'color:red';

  testPassed('Did not crash');
}
