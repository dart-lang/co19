/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a typedef, either directly, or recursively
 * via another typedef, is a compile time error.
 * @description Checks that it is compile error if two typedefs are mutually
 * recursive via their formal parameter types.
 * @compile-error
 * @author ilya
 */

typedef F(G x);
typedef G(F x);

main() {
  try {
    F x;
  } catch (e) {}
}
