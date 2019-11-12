/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an extension application occurs in a
 * place where it is not the target expression of a simple or composite member
 * invocation. That is, the only valid use of an extension application is to
 * invoke members on it.
 *
 * @description Check that it is a compile-time error if an extension
 * application occurs in a place where it is not the target expression of a
 * simple or composite member invocation. Test |= operator
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
  int value;
  C() : value = 0 {}
}

extension Ext on C {
  C operator |(int val) {
    this.value += val;
    return this;
  }
}

main() {
  C c = C();
  Ext(c) |= 42;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
