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
 * @description Check that if opted-in class ia a mixin with legacy class, child
 * migrated method with [Never] return value cannot be called and compile error
 * is thrown in this case.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "override_checking_legacy_lib.dart";

class A with LEGACY_RETURN {
  Never getInt()              => throw "It's impossible!";
  Never getObject()           => throw "It's impossible!";
  Never getDynamic()          => throw "It's impossible!";
  Never getFunction()         => throw "It's impossible!";
  Never getNull()             => throw "It's impossible!";
  Never getFutureOr()         => throw "It's impossible!";
  Never getFutureOrInt()      => throw "It's impossible!";
  Never getFutureOrFunction() => throw "It's impossible!";
}

main() {
  A a = A();

  a.getInt();
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getObject();
//  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getDynamic();
//  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getFunction();
//  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getNull();
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getFutureOr();
//  ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getFutureOrInt();
//  ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  a.getFutureOrFunction();
//  ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
