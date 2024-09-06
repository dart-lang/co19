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
/// @description Checks that within an augmenting field `augmented` invokes the
/// original field's initializer expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A03_t02_lib.dart';

String augmented() => "Top-level augmented(), shouldn't be invoked";

String foo() => "Original";

var topLevelVariable = foo;
final finalTopLevelVariable = foo;

class C {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  var instanceVariable = foo;
  final finalInstanceVariable = foo;
  static String augmented() => "C.augmented(), shouldn't be invoked";
}

mixin M {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  var instanceVariable = foo;
  final finalInstanceVariable = foo;
  static String augmented() => "M.augmented(), shouldn't be invoked";
}

enum E {
  e1;

  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  final finalInstanceVariable = foo;
  static String augmented() => "E.augmented(), shouldn't be invoked";
}

class A {}

extension Ext on A {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  static String augmented() => "Ext.augmented(), shouldn't be invoked";
}

class MA = Object with M;

main() {
  Expect.equals("Augment: Original", topLevelVariable());
  Expect.equals("Augment: Original", finalTopLevelVariable());
  Expect.equals("Augment: Original", C.staticVariable());
  Expect.equals("Augment: Original", C.finalStaticVariable());
  Expect.equals("Augment: Original", C().instanceVariable());
  Expect.equals("Augment: Original", C().finalInstanceVariable());
  Expect.equals("Augment: Original", M.staticVariable());
  Expect.equals("Augment: Original", M.finalStaticVariable());
  Expect.equals("Augment: Original", MA().instanceVariable());
  Expect.equals("Augment: Original", MA().finalInstanceVariable());
  Expect.equals("Augment: Original", E.staticVariable());
  Expect.equals("Augment: Original", E.finalStaticVariable());
  Expect.equals("Augment: Original", E.e1.finalInstanceVariable());
  Expect.equals("Augment: Original", Ext.staticVariable);
  Expect.equals("Augment: Original", Ext.finalStaticVariable);
}
