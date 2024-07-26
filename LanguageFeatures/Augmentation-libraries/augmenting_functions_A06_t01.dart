// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmenting declaration uses `augmented` when the augmented declaration
///   has no concrete implementation. Note that all external declarations are
///   assumed to have an implementation provided by another external source, and
///   they will throw a runtime exception when called if not.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration uses `augmented` when the original declaration has no concrete
/// implementation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_functions_A06_t01_lib.dart';

class C1 {
  void foo();
}

abstract class C2 {
  void foo();
}

mixin M {
  void foo();
}

enum E {
  e1;
  void foo();
}

class A {}

extension Ext on A {
  void foo();
}

extension type ET(int _) {
  void foo();
}

main() {
  print(C1);
  print(C2);
  print(M);
  print(E);
  print(A);
  print(ET);
}
