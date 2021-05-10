// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion It is a compile error to derive a mixin from a class which has a
 * superclass other than Object.
 * @description Checks that it is a compile error to derive a mixin from a class
 * which has a superclass other than Object. Test type aliases
 * @issue 26409
 * @issue 42254
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class Sstatic {
}

class M extends Sstatic {
}

class SuperA {
}

typedef AliasA = SuperA;
typedef AliasM = M;

class A = AliasA with AliasM;
//                    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  new A();
}
