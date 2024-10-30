// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function body is either:
/// ...
/// - of the form `=> e` or the form `async => e`, which both return the value
///   of the expression `e` as if by a `return e`. The other modifiers do not
///   apply here, because they apply only to generators, discussed below.
///   Generators are not allowed to explicitly return anything, objects are
///   added to the generated stream or iterable using `yield` or `yield*`.
///
/// @description Checks that it is a compile-time error if a function with a
/// short syntax contains `async*` modifier.
/// @author sgrekhov22@qmail.com

import 'dart:async';

Stream<int> f1() async* => 1;
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
Stream<int> f2() async* => [1];
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
Stream<int> f3() async* => Stream.fromIterable([1]);
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
Stream<void> f4() async* => 1 as dynamic;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
Stream<void> f5() async* => null;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
Stream<void> f6() async* => print(""); // print("") returns void
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
FutureOr<Stream<int>> f7() async* => 1;
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
  print(f6);
  print(f7);
}
