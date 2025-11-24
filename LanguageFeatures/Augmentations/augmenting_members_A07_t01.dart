// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// A late final variable with no initializer expression is augmented by an
/// augmenting variable with an initializer expression.
///
/// @description Checks that that it is a compile-time error if a late final
/// variable with no initializer expression is augmented by an augmenting
/// variable with an initializer expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_members_A07_t01_lib.dart';

late final String? finalTopLevelVariable;

class C {
  static late final String? finalStaticVariable;
  late final String? finalInstanceVariable;
}

mixin M {
  static late final String? finalStaticVariable;
  late final String? finalInstanceVariable;
}

enum E {
  e1;
  static late final String? finalStaticVariable;
}

class A {}

extension Ext on A {
  static late final String? finalStaticVariable;
}

extension type ET(int _) {
  static late final String? finalStaticVariable;
}

main() {
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
