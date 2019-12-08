/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class implements two classes (one is
 * legacy), child migrated method with [Never] return value cannot be called and
 * compile error is thrown in this case.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

abstract class B {
  Never test_return_never();
}

class A1 implements A {
  Never test_return_never() => throw "It's impossible!";
  int? test_return_nullable() => 1;
}

main() {
  A1 a = A1();
  a.test_return_never();
//  ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
