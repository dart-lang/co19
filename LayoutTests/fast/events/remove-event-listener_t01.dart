/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Removes a non-existing event listener
 */
import "dart:html";

main() {
  // following code should leak the function and window/document objects.
  leaked(e) { var a = window; }
  document.removeEventListener("mousemove", leaked, true);
}
