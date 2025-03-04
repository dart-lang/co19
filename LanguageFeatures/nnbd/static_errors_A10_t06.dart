// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if an optional parameter (named or otherwise) with
/// no default value has a potentially non-nullable type except in the parameter
/// list of an abstract method declaration.
///
/// @description Check that it is a compile-time error if an optional parameter
/// (named or otherwise) with no default value has a potentially non-nullable
/// type. Test <T extends Object>
/// @author sgrekhov@unipro.ru
/// @issue 40954

class C {
  static void test1<T extends Object>(var v, [T t]) {}
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified

  static void test2<T extends Object>(var v, {T t}) {}
//                                              ^
// [analyzer] unspecified
// [cfe] unspecified

  void test11<T extends Object>(var v, [T t]) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified

  void test22<T extends Object>(var v, {T t}) {}
//                                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

void test1<T extends Object>(var v, [T t]) {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

void test2<T extends Object>(var v, {T t}) {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
