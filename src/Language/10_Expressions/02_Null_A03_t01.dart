/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to instantiate Null causes a run-time error.
 * @description Checks that Null cannot be instantiated.
 * @author hlodvig
 * @reviewer iefremov
 * @compile-error
 * @needsreview Class Null is inaccessible. This test stub simply holds the assertion text.
 * It may be possible to write one once the reflection framework becomes available.
 */

main() {
  new Null();
}
