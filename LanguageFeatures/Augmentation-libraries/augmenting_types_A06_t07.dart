// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, enum, extension type, mixin, or mixin class augmentation
/// may specify `extends`, `implements` and `with` clauses (when generally
/// supported). The types in these clauses are appended to the introductory
/// declarations’ clauses of the same kind, and if that clause did not exist
/// previously, then it is added with the new types. All regular rules apply
/// after this appending process, so you cannot have multiple `extends` on a
/// class, or an `on` clause on an enum, etc.
///
/// @description Checks that it is a compile-time error if an augment adds a
/// superclass in an `extends` statement which is incompatible with existing
/// class members
/// @author sgrekhov22@gmail.com
/// @issue 55472

// SharedOptions=--enable-experiment=macros

part 'augmenting_types_A06_t07_lib.dart';

abstract class A {
  int foo();
}

class C1 {
  String get foo => "C1";
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class C2 {
  void set foo(String _);
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
