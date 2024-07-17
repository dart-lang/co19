// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// When applying an augmenting declaration that contains a type annotation at
/// one of these positions, to a definition to be augmented, it's a compile-time
/// error if the type denoted by the augmenting declaration is not the same type
/// as the type that the augmented definition has at the corresponding position.
/// An augmenting declaration can omit type annotations, but if it doesn't, it
/// must repeat the type from the augmented definition.
///
/// @description Check that it is not an error if augmenting declaration
/// specifies the same variable type as the augmented declaration does.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'type_inheritance_A03_t03_lib.dart';
import '../../Utils/expect.dart';

var topLevelVariable = "Original";
final finalTopLevelVariable = "Original";

class C {
  static var staticVariable = "Original";
  static final finalStaticVariable = "Original";
  var instanceVariable = "Original";
  final finalInstanceVariable = "Original";
}

mixin M {
  static var staticVariable = "Original";
  static final finalStaticVariable = "Original";
  var instanceVariable = "Original";
  final finalInstanceVariable = "Original";
}

enum E {
  e0;
  static var staticVariable = "Original";
  static final finalStaticVariable = "Original";
  final finalInstanceVariable = "Original";
}

class A {}

extension Ext on A {
  static var staticVariable = "Original";
  static final finalStaticVariable = "Original";
}

extension type ET(int id) {
  static var staticVariable = "Original";
  static final finalStaticVariable = "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelVariable);
  Expect.equals("Augmented", finalTopLevelVariable);
  Expect.equals("Augmented", C.staticVariable);
  Expect.equals("Augmented", C.finalStaticVariable);
  Expect.equals("Augmented", C().instanceVariable);
  Expect.equals("Augmented", C().finalInstanceVariable);
  Expect.equals("Augmented", M.staticVariable);
  Expect.equals("Augmented", M.finalStaticVariable);
  Expect.equals("Augmented", MA().instanceVariable);
  Expect.equals("Augmented", MA().finalInstanceVariable);
  Expect.equals("Augmented", E.staticVariable);
  Expect.equals("Augmented", E.finalStaticVariable);
  Expect.equals("Augmented", E.e0.finalInstanceVariable);
  Expect.equals("Augmented", Ext.staticVariable);
  Expect.equals("Augmented", Ext.finalStaticVariable);
  Expect.equals("Augmented", ET.staticVariable);
  Expect.equals("Augmented", ET.finalStaticVariable);
}
