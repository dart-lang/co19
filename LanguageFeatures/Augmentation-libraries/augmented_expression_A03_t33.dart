// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting variable declaration, `augmented`
///   can only be used in an initializer expression, and refers to the augmented
///   variable's initializing expression, which is immediately evaluated.
///
/// It is a compile-time error to use `augmented` in an augmenting variable's
/// initializer if the member being augmented is not a variable declaration with
/// an initializing expression.
///
/// @description Checks that it is a compile-time error if an augmenting field
/// has a metadata named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class augmented {
  const augmented();
}

@augmented()
var topLevelVariable = "Original";
@augmented()
final finalTopLevelVariable = "Original";

@augmented()
augment var topLevelVariable = "Augment";

@augmented()
augment final finalTopLevelVariable = "Augment";


class C {
  @augmented()
  static var staticVariable1 = "Original";
  @augmented()
  static final finalStaticVariable1 = "Original";
  @augmented()
  var instanceVariable1 = "Original";
  @augmented()
  final finalInstanceVariable1 = "Original";
}

augment class C {
  @augmented() augment static var staticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment static final finalStaticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment var instanceVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment final finalInstanceVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static var staticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static final finalStaticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() var instanceVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() final finalInstanceVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  @augmented()
  static var staticVariable1 = "Original";
  @augmented()
  static final finalStaticVariable1 = "Original";
  @augmented()
  var instanceVariable1 = "Original";
  @augmented()
  final finalInstanceVariable1 = "Original";
}

augment mixin M {
  @augmented() augment static var staticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment static final finalStaticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment var instanceVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment final finalInstanceVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static var staticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static final finalStaticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() var instanceVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() final finalInstanceVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  @augmented()
  static var staticVariable1 = "Original";
  @augmented()
  static final finalStaticVariable1 = "Original";
  @augmented()
  final finalInstanceVariable1 = "Original";
}

augment enum E {
  e1;

  @augmented() augment static var staticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment static final finalStaticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment final finalInstanceVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static var staticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static final finalStaticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() final finalInstanceVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  @augmented()
  static var staticVariable1 = "Original";
  @augmented()
  static final finalStaticVariable1 = "Original";
}

augment extension Ext {
  @augmented() augment static var staticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment static final finalStaticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static var staticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static final finalStaticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  @augmented()
  static var staticVariable1 = "Original";
  @augmented()
  static final finalStaticVariable1 = "Original";
}

augment extension type ET {
  @augmented() augment static var staticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() augment static final finalStaticVariable1 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static var staticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @augmented() static final finalStaticVariable2 = "Augment";
// ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(topLevelVariable);
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
