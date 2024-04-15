// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, or mixin augmentation may specify
/// extends, implements, on, and with clauses (when generally supported). The
/// types in these clauses are appended to the original declarations clauses of
/// the same kind, and if that clause did not exist previously then it is added
/// with the new types. All regular rules apply after this appending process, so
/// you cannot have multiple extends on a class, or an on clause on an enum, etc
///
/// @description Checks that it is a compile-time error if a class, mixin or
/// enum augment specifies an interface in an `implements` clause which is not
/// compatible with existing interfaces
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A07_t08_lib.dart';

abstract interface class I1 {
  String foo();
}

abstract interface class I2 {
  int foo();
}

class C1 implements I1 {
  String foo() => "С1";
}

abstract class C2 implements I1 {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M implements I1 {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

enum E implements I1 {
  e1;
  String foo() => "E";
}

main() {
  print(C1);
  print(C2);
  print(M);
  print(E);
}
