/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Underflows and overflows are ignored.
 * @description Assign some values greater than maximum finite double.
 * @author pagolubev
 * @reviewer akuznecov
 */


void main() {
  double x;

  x = 1e1000;
  x = -1e1000;

  x = 1.7976931348623167e308;
  x = -1.7976931348623167e308;

  x = 1e308d + 1e308;
  x = -1e308d - 1e308;
}
