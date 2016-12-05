/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double remainder(num other)
 * @description Checks that remainder value sign follows the sign of the
 * dividend.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  double x = 1.19, y = .2;
  Expect.equals( 0.1899999999999999, x.remainder(y) );

  x = -1.19; y = .2;
  Expect.equals( -0.1899999999999999, x.remainder(y) );

  x = 1.19; y = -.2;
  Expect.equals( 0.1899999999999999, x.remainder(y) );

  x = -1.19; y = -.2;
  Expect.equals( -0.1899999999999999, x.remainder(y) );

  x = -1.19; y = 20.0;
  Expect.equals(-1.19, x.remainder(y) );
}
