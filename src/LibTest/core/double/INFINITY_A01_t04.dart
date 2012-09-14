/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double INFINITY
 * @description Checks that type of INFINITY is double
 * @author hlodvig
 */


main() {
  Expect.isFalse(double.INFINITY is int);
  Expect.isTrue(double.INFINITY is double);
  Expect.isTrue(double.INFINITY is num);
}
