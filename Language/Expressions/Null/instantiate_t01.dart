/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to instantiate Null causes a run-time error.
 * @description Checks that Null cannot be instantiated.
 * @compile-error
 * @author rodionov
 */

main() {
  new Null();
}
