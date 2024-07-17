// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a variable type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'type_inheritance_A01_t02.dart';

augment var topLevelVariable = "Augmented top-level variable";
augment final finalTopLevelVariable = "Augmented top-level variable";

augment class C {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable = "Augmented static variable";
  augment var instanceVariable = "Augmented instance variable";
  augment final finalInstanceVariable = "Augmented instance variable";
}

augment mixin M {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable = "Augmented static variable";
  augment var instanceVariable = "Augmented instance variable";
  augment final finalInstanceVariable = "Augmented instance variable";
}

augment enum E {
  augment e0;
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable = "Augmented static variable";
  augment final finalInstanceVariable = "Augmented instance variable";
}

augment extension Ext {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable = "Augmented static variable";
}

augment extension type ET(int id) {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable = "Augmented static variable";
  augment final id = 42;
}
