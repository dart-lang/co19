/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a literal double is double.
 * @description Checks that no static warnings are produced when assigning
 * double literals to a typed double variable.
 * @static-clean
 * @author iefremov
 * @reviewer rodionov
 */

main() {
  double d = 1.0;
  d = 0.0;
  d = 124.12414148124e-1242;
  d = double.nan;
}
