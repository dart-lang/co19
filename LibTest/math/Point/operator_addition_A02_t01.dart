/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Point<T> operator +(Point<T> other)
 * @description Checks that arguments cannot be null
 * @author sgrekhov@unipro.ru
 */
import "dart:math";

main() {
  new Point(0, 0) + new Point(1, null); //# 01: compile-time error
  new Point(0, 0) + new Point(null, 1); //# 02: compile-time error
  new Point(0, null) + new Point(1, 1); //# 03: compile-time error
  new Point(null, 0) + new Point(1, 1); //# 04: compile-time error
}
