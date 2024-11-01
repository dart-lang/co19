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
/// the augmented function. Test a local function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t29.dart';

augment String topLevelFunction() {
  String local() => "Augmented:" + augmented();
  return local();
}

augment class C {
  augment static String staticMethod(){
    String local() => "Augmented:" + augmented();
    return local();
  }
  augment String instanceMethod() {
    String local() => "Augmented:" + augmented();
    return local();
  }
}

augment mixin M {
  augment static String staticMethod(){
    String local() => "Augmented:" + augmented();
    return local();
  }
  augment String instanceMethod() {
    String local() => "Augmented:" + augmented();
    return local();
  }
}

augment enum E {
  augment e1;

  augment static String staticMethod(){
    String local() => "Augmented:" + augmented();
    return local();
  }
  augment String instanceMethod() {
    String local() => "Augmented:" + augmented();
    return local();
  }
}

augment extension Ext {
  augment static String staticMethod(){
    String local() => "Augmented:" + augmented();
    return local();
  }
  augment String instanceMethod() {
    String local() => "Augmented:" + augmented();
    return local();
  }
}

augment extension type ET {
  augment static String staticMethod(){
    String local() => "Augmented:" + augmented();
    return local();
  }
  augment String instanceMethod() {
    String local() => "Augmented:" + augmented();
    return local();
  }
}
