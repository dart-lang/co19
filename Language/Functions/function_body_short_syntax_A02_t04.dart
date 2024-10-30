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
/// @description Checks that it is a compile-time error if a method with a
/// short syntax contains `sync*` modifier.
/// @author sgrekhov22@qmail.com

import 'dart:async';

class C {
  static Iterable<int> staticMethod() sync* => 1;
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  Iterable<int> instanceMethod() sync* => 1;
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static Iterable<int> staticMethod() sync* => 1;
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  Iterable<int> instanceMethod() sync* => 1;
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static Iterable<int> staticMethod() sync* => 1;
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  Iterable<int> instanceMethod() sync* => 1;
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static Iterable<int> staticMethod() sync* => 1;
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  Iterable<int> instanceMethod() sync* => 1;
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static Iterable<int> staticMethod() sync* => 1;
//                                          ^^
// [analyzer] unspecified
// [cfe] unspecified
  Iterable<int> instanceMethod() sync* => 1;
//                                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
