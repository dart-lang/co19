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
/// original field's initializer expression. Test late variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A03_t12_lib.dart';

String get augmented => "Top-level augmented, shouldn't be invoked";

int counter = 1;
String get foo => "Original ${counter++}";

late var topLevelVariable = foo;
late final finalTopLevelVariable = foo;

class C {
  static late var staticVariable = foo;
  static late final finalStaticVariable = foo;
  late var instanceVariable = foo;
  late final finalInstanceVariable = foo;
  static String get augmented => "C.augmented, shouldn't be invoked";
}

mixin M {
  static late var staticVariable = foo;
  static late final finalStaticVariable = foo;
  late var instanceVariable = foo;
  late final finalInstanceVariable = foo;
  static String get augmented => "M.augmented, shouldn't be invoked";
}

enum E {
  e1;
  static late var staticVariable = foo;
  static late final finalStaticVariable = foo;
  static String get augmented => "E.augmented, shouldn't be invoked";
}

class A {}

extension Ext on A {
  static late var staticVariable = foo;
  static late final finalStaticVariable = foo;
  static String get augmented => "Ext.augmented, shouldn't be invoked";
}

class MA = Object with M;

main() {
  Expect.equals("1: Original 1, 2: Original 2", topLevelVariable);
  Expect.equals("1: Original 3, 2: Original 4", finalTopLevelVariable);
  Expect.equals("1: Original 5, 2: Original 6", C.staticVariable);
  Expect.equals("1: Original 7, 2: Original 8", C.finalStaticVariable);
  Expect.equals("1: Original 9, 2: Original 10", C().instanceVariable);
  Expect.equals("1: Original 11, 2: Original 12", C().finalInstanceVariable);
  Expect.equals("1: Original 13, 2: Original 14", M.staticVariable);
  Expect.equals("1: Original 15, 2: Original 16", M.finalStaticVariable);
  Expect.equals("1: Original 17, 2: Original 18", MA().instanceVariable);
  Expect.equals("1: Original 19, 2: Original 20", MA().finalInstanceVariable);
  Expect.equals("1: Original 21, 2: Original 22", E.staticVariable);
  Expect.equals("1: Original 23, 2: Original 24", E.finalStaticVariable);
  Expect.equals("1: Original 25, 2: Original 26", Ext.staticVariable);
  Expect.equals("1: Original 27, 2: Original 28", Ext.finalStaticVariable);
}
