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
/// @description Checks that it is a compile-time error if within an augmenting
/// getter `augmented()` expression is invoked, and the augmented declaration
/// does not return a callable type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A01_t03_lib.dart';

String augmented() => "Global function, shouldn't be invoked";
String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  static String augmented() => "C.augmented(), shouldn't be invoked";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  static String augmented() => "M.augmented(), shouldn't be invoked";
}

enum E {
  e1;

  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  static String augmented() => "E.augmented(), shouldn't be invoked";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  static String augmented() => "Ext.augmented(), shouldn't be invoked";
}

class MA = Object with M;

main() {
  print(topLevelGetter);
  print(C);
  print(M);
  print(E);
  print(A);
}
