// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A `const` variable is augmented by an augmenting getter.
///
/// @description Checks that that it is a compile-time error if a `const`
/// variable is augmented by an augmenting getter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_members_A08_t01_lib.dart';

const topLevelConstant = "Original";

class C {
  static const staticConstant = "Original";
}

mixin M {
  static const staticConstant = "Original";
}

enum E {
  e1;
  static const staticConstant = "Original";
}

class A {}

extension Ext on A {
  static const staticConstant = "Original";
}

extension type ET(int _) {
  static const staticConstant = "Original";
}

main() {
  print(topLevelConstant);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
