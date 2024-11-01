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
/// original field's initializer expression. Test a function literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A03_t29.dart';

augment var topLevelVariable = () {
  var f = () => "Augment: " + augmented();
  return f();
};
augment final finalTopLevelVariable = () {
  var f = () => "Augment: " + augmented();
  return f();
};

augment class C {
  augment static var staticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment static final finalStaticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment var instanceVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment final finalInstanceVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
}

augment mixin M {
  augment static var staticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment static final finalStaticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment var instanceVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment final finalInstanceVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
}

augment enum E {
  augment e1;

  augment static var staticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment static final finalStaticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment final finalInstanceVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
}

augment extension Ext {
  augment static var staticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment static final finalStaticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
}

augment extension type ET {
  augment static var staticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
  augment static final finalStaticVariable = () {
    var f = () => "Augment: " + augmented();
    return f();
  };
}
