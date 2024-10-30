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
/// short syntax contains `sync*` modifier.
/// @author sgrekhov22@qmail.com

import 'dart:async';

Iterable<int> f1() sync* => 1;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
Iterable<int> f2() sync* => [1];
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
Iterable<int> f3() sync* => Stream.fromIterable([1]);
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
Iterable<void> f4() sync* => 1 as dynamic;
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
Iterable<void> f5() sync* => null;
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
Iterable<void> f6() sync* => print(""); // print("") returns void
//                        ^^
// [analyzer] unspecified
// [cfe] unspecified
FutureOr<Iterable<int>> f7() sync* => 1;
//                                 ^^
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
