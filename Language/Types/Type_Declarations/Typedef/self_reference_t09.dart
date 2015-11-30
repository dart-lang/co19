/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a typedef, either directly, or recursively
 * via another typedef, is a compile time error.
 * @description Checks that it is compile error to reference type alias in a
 * bound of its own type parameter.
 * @compile-error
 * @author ilya
 */

typedef F<T extends List<F>>();

main() {
  try {
    F<int> x;
  } catch (e) {}
}
