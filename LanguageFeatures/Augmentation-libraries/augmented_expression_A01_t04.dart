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
/// getter `augmented =` expression is invoked.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A01_t04_lib.dart';

void set augmented(String value) {}

final String topLevelVariable = "Original";

class C {
  static String staticField = "Original";
  String instanceField = "Original";
  void set augmented(String value) {}
}

mixin M {
  static String staticField = "Original";
  String instanceField = "Original";
  void set augmented(String value) {}
}

enum E {
  e1;

  static String staticField = "Original";
  final String instanceField = "Original";
  void set augmented(String value) {}
}

class A {}

extension Ext on A {
  static String staticField = "Original";
  static void set augmented(String value) {}
}

class MA = Object with M;

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
}
