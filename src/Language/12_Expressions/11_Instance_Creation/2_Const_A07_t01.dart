/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is a parameterized type S<U1, ,.., Um>, let R = S;
 * It is a compile time error if S is not a generic type with m type parameters.
 * @description Checks that it is a compile-time error if S is not a generic type.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class  S {
  const S();
}

main() {
  try {
    const S<int, bool>();
  } catch(e) {}
}
