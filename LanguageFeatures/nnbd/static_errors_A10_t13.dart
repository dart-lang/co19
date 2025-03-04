// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if an optional parameter (named or otherwise) with
/// no default value has a potentially non-nullable type except in the parameter
/// list of an abstract method declaration.
///
/// @description Check that it is a compile-time error if an optional parameter
/// (named or otherwise) with no default value has a potentially non-nullable
/// type. Test FutureOr<A*>
/// @author sgrekhov@unipro.ru
/// @issue 40954

import "dart:async";

class A {}

class C {
  static void test1(var v, [FutureOr<FutureOr<A>> fo]) {}
//                                                ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void test2(var v, {FutureOr<FutureOr<A>> fo}) {}
//                                                ^^
// [analyzer] unspecified
// [cfe] unspecified

  void test11(var v, [FutureOr<FutureOr<A>> fo]) {}
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified

  void test22(var v, {FutureOr<FutureOr<A>> fo}) {}
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

void test1(var v, [FutureOr<FutureOr<A>> fo]) {}
//                                       ^^
// [analyzer] unspecified
// [cfe] unspecified

void test2(var v, {FutureOr<FutureOr<A>> fo}) {}
//                                       ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
