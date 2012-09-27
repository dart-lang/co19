/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to instantiate Null causes a run-time error.
 * @description Checks that Null cannot be instantiated.
 * @author rodionov
 * @static-warning new expression references an inaccessible class
 * @needsreview Class Null is inaccessible. This test stub simply holds the assertion text.
 * It may be possible to write one once the reflection framework becomes available.
 */

main() {
  try {
    new Null();
  } catch(anything) { // 11.11.1 New: If T is not a class accessible in the current scope, a dynamic error occurs.
  }
}
