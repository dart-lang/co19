// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: When augmenting a function, `augmented` refers to
///   the augmented function. Tear offs are not allowed, so this function must
///   immediately be invoked.
///
/// @description Checks that within an augmenting function `augmented()` invokes
/// the augmented function. Test a function literal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A04_t30.dart';

augment String topLevelFunction() {
  var f = () => "Augmented:" + augmented();
  return f();
}

augment class C {
  augment static String staticMethod(){
    var f = () => "Augmented:" + augmented();
    return f();
  }
  augment String instanceMethod() {
    var f = () => "Augmented:" + augmented();
    return f();
  }
}

augment mixin M {
  augment static String staticMethod(){
    var f = () => "Augmented:" + augmented();
    return f();
  }
  augment String instanceMethod() {
    var f = () => "Augmented:" + augmented();
    return f();
  }
}

augment enum E {
  augment e1;

  augment static String staticMethod(){
    var f = () => "Augmented:" + augmented();
    return f();
  }
  augment String instanceMethod() {
    var f = () => "Augmented:" + augmented();
    return f();
  }
}

augment extension Ext {
  augment static String staticMethod(){
    var f = () => "Augmented:" + augmented();
    return f();
  }
  augment String instanceMethod() {
    var f = () => "Augmented:" + augmented();
    return f();
  }
}
