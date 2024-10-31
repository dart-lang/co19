// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   augmented getter and evaluates to its return value. If augmenting a
///   variable with a getter, this will invoke the implicitly induced getter
///   from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error to augment a getter
/// whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A01_t20_lib.dart';

String get augmented => "Global getter";

class C1 {
  static String get augmented => "Static getter of a class";
}

class C2 {
  String get augmented => "Instance getter of a class";
}

mixin M1 {
  static String get augmented => "Static getter of a mixin";
}

mixin M2 {
  String get augmented => "Instance getter of a mixin";
}

enum E1 {
  e1;

  static String get augmented => "Static getter of an enum";
}

enum E2 {
  e1;

  String get augmented => "Instance getter of an enum";
}

class A {}

extension Ext1 on A {
  static String get augmented => "Static getter of an extension";
}

extension Ext2 on A {
  String get augmented => "Instance getter of an extension";
}

extension type ET1(int _) {
  static String get augmented => "Static getter of an extension";
}

extension type ET2(int _) {
  String get augmented => "Instance getter of an extension";
}

main() {
  print(augmented);
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E1);
  print(E2);
  print(A);
  print(ET1);
  print(ET2);
}
