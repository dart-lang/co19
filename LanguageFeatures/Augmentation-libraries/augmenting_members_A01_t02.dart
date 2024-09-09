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
/// implementation. Test static members.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_members_A01_t02_lib.dart';

class C {
  static void abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

mixin M {
  static void abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

enum E {
  e0;
  static void abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

class A {}

extension Ext on A {
  static void abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

extension type ET(String _) {
  static void abstractMethod();
  static String get abstractGetter;
  static void set abstractSetter(String v);
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
