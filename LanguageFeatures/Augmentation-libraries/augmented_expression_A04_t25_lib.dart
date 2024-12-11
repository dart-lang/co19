// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that within an augmenting function `augmented()` invokes
/// the augmented function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t25.dart';
import '../../Utils/expect.dart';

augment String topLevelFunction() {
  Expect.equals("Original", augmented());
  return "Augmented";
}

augment class C {
  augment factory C.f() {
    var ag = augmented();
    Expect.equals("Original", ag.log);
    ag.log = "Augmented";
    return ag;
  }
  augment static String staticMethod(){
    Expect.equals("Original", augmented());
    return "Augmented";
  }
  augment String instanceMethod() {
    Expect.equals("Original", augmented());
    return "Augmented";
  }
}

augment mixin M {
  augment static String staticMethod(){
    Expect.equals("Original", augmented());
    return "Augmented";
  }
  augment String instanceMethod() {
    Expect.equals("Original", augmented());
    return "Augmented";
  }
}

augment enum E {
  augment e1;

  augment static String staticMethod(){
    Expect.equals("Original", augmented());
    return "Augmented";
  }
  augment String instanceMethod() {
    Expect.equals("Original", augmented());
    return "Augmented";
  }
}

augment extension Ext {
  augment static String staticMethod(){
    Expect.equals("Original", augmented());
    return "Augmented";
  }
  augment String instanceMethod() {
    Expect.equals("Original", augmented());
    return "Augmented";
  }
}

augment extension type ET {
  augment factory ET.f() {
    Expect.equals("Original", augmented().v);
    return ET("Augmented");
  }
  augment static String staticMethod(){
    Expect.equals("Original", augmented());
    return "Augmented";
  }
  augment String instanceMethod() {
    Expect.equals("Original", augmented());
    return "Augmented";
  }
}
