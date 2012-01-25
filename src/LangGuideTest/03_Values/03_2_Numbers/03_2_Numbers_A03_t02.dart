/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Underflows and overflows are ignored.
 * @description Assign some values less than minimum finite double.
 * @author pagolubev
 * @reviewer akuznecov
 */


main() {
  double x;

  x = 1e-1000;
  x = -1e-1000;

  x = 4.9406564584124644e-324;
  x = -4.9406564584124644e-324;

  x = 4.9406564584124654e-324 / 2;
  x = -4.9406564584124654e-324 / 2;
}
