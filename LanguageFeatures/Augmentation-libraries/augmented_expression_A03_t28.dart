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
/// original field's initializer expression. Test a local function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A03_t28_lib.dart';

String augmented() => "Top-level augmented(), shouldn't be invoked";

int counter = 1;
String foo() => "Original ${counter++}";

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

extension type ET(int _) {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  static String augmented() => "ET.augmented(), shouldn't be invoked";
}

class MA = Object with M;

main() {
  Expect.equals("Augment: Original 1", topLevelVariable());
  Expect.equals("Augment: Original 2", finalTopLevelVariable());
  Expect.equals("Augment: Original 3", C.staticVariable());
  Expect.equals("Augment: Original 4", C.finalStaticVariable());
  Expect.equals("Augment: Original 5", C().instanceVariable());
  Expect.equals("Augment: Original 6", C().finalInstanceVariable());
  Expect.equals("Augment: Original 7", M.staticVariable());
  Expect.equals("Augment: Original 8", M.finalStaticVariable());
  Expect.equals("Augment: Original 9", MA().instanceVariable());
  Expect.equals("Augment: Original 10", MA().finalInstanceVariable());
  Expect.equals("Augment: Original 11", E.staticVariable());
  Expect.equals("Augment: Original 12", E.finalStaticVariable());
  Expect.equals("Augment: Original 13", E.e1.finalInstanceVariable());
  Expect.equals("Augment: Original 14", Ext.staticVariable());
  Expect.equals("Augment: Original 15", Ext.finalStaticVariable());
  Expect.equals("Augment: Original 16", ET.staticVariable());
  Expect.equals("Augment: Original 17", ET.finalStaticVariable());
}
