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
/// @description Checks that it is a compile-time error to use a type whose name
/// is `augmented` in `is` and `as` expressions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A01_t27_lib.dart';

typedef augmented = Null;

String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

enum E {
  e1;

  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class A {}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

extension type ET(int _) {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

main() {
  topLevelGetter;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
