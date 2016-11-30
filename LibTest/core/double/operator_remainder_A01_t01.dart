/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double operator %(num other)
 * @description Checks that operator % returns non-negative remainder regardless
 * of the operands signs (chooses positive one from two possible remainder values).
 * Values were calculated in java using operator % and Math.IEEERemainder().
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  double x = 1.19, y = .2;
  Expect.equals( 0.1899999999999999, x % y );

  x = -1.19; y = .2;
  Expect.equals( 0.01000000000000012, x % y );

  x = 1.19; y = -.2;
  Expect.equals( 0.1899999999999999, x % y );

  x = -1.19; y = -.2;
  Expect.equals( 0.01000000000000012, x % y );

  x = -1.19; y = 20.0;
  Expect.equals(18.81, x % y );
}
