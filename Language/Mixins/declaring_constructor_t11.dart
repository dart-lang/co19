/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a declared or derived mixin
 * explicitly declares a constructor.
 * @description Checks that it is a compile-time error if a derived mixin
 * explicitly declares a constructor.
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class A {
}

class M {
  M() {}
}

typedef MAlias = M;

class C extends A with MAlias {
}

main() {
  new C();
}
