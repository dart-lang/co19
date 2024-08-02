// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting declaration uses `augmented` when the augmented
/// declaration has no concrete implementation. Note that all external
/// declarations are assumed to have an implementation provided by another
/// external source, and otherwise they will throw a runtime error when called.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration uses `augmented` when the augmented declaration has no concrete
/// implementation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_members_A01_t01_lib.dart';

abstract class A {
  void abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

class C {
  void abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

mixin M {
  void abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

enum E {
  e0;
  void abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

class B {}

extension Ext on B {
  void abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

extension type ET(String _) {
  void abstractMethod();
  String get abstractGetter;
  void set abstractSetter(String v);
}

main() {
  print(A);
  print(C);
  print(M);
  print(E);
  print(B);
  print(ET);
}
