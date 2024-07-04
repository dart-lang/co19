// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting field, augmented can only be used
///   in an initializer expression, and refers to the original field's
///   initializer expression, which is immediately evaluated.
///
/// It is a compile-time error to use augmented in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that within an augmenting field `augmented` invokes the
/// original field's initializer expression. Test a local function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t28.dart';

augment var topLevelVariable = () {
  String local() => "Augment: " + augmented();
  return local();
};
augment final finalTopLevelVariable = () {
  String local() => "Augment: " + augmented();
  return local();
};

augment class C {
  augment static var staticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment static final finalStaticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment var instanceVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment final finalInstanceVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
}

augment mixin M {
  augment static var staticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment static final finalStaticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment var instanceVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment final finalInstanceVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
}

augment enum E {
  augment e1;

  augment static var staticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment static final finalStaticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment final finalInstanceVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
}

augment extension Ext {
  augment static var staticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
  augment static final finalStaticVariable = () {
    String local() => "Augment: " + augmented();
    return local();
  };
}
