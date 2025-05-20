// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the `extends` keyword. For a variable
/// or parameter, a `var` keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a variable type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A01_t02.dart';

augment var topLevelVariable = "Augmented top-level variable";
augment final finalTopLevelVariable;

augment class C {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment var instanceVariable = "Augmented instance variable";
  augment final finalInstanceVariable;
}

augment mixin M {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment var instanceVariable = "Augmented instance variable";
  augment final finalInstanceVariable;
}

augment enum E {
  augment e0;
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment final finalInstanceVariable;
}

augment extension Ext {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
}

augment extension type ET {
  augment static var staticVariable = "Augmented static variable";
  augment static final finalStaticVariable;
  augment final id;
}
