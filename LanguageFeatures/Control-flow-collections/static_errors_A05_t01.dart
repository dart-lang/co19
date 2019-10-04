/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error when the type of the iterator expression in a
 * synchronous for-in element may not be assigned to Iterable<T> for some type T
 *
 * @description Checks that it is a static error when the type of the iterator
 * expression in a synchronous for-in element may not be assigned to
 * Iterable<T> for some type T.
 * @author sgrekhov@unipro.ru
 */

main() {
  [for (var i in "not iterable") i];                //# 01: compile-time error
  [for (var i in 3.14) i];                          //# 02: compile-time error
}
