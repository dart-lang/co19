/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description To pass, this test should not crash
 */
import "dart:html";

main() {
  var o = new Text('');
  try {
    o.data = null;
    o.splitText(1);
  } catch (e) {}
}
