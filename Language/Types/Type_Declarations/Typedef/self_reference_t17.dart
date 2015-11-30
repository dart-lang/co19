/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a typedef, either directly, or recursively
 * via another typedef, is a compile time error.
 * @description Checks that it is compile error if two typedefs are mutually
 * recursive via their parameters types.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

typedef void F(G g);
typedef void G(List<F> f);

main() {
  try {
    F x;
  } catch (e) {}
}
