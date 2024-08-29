// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The `late` property of a variable must always be consistent
/// between the augmented variable and its augmenting variables.
///
/// @description Checks that `late` variable can be augmented.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_variables_A04_t01.dart';

augment late String topLevelVariable = "Augmented";
augment late String finalTopLevelVariable = "Augmented";

augment class C {
  augment static late String staticVariable = "Augmented";
  augment static late final String finalStaticVariable = "Augmented";
  augment late String instanceVariable = "Augmented";
  augment late final String finalInstanceVariable = "Augmented";
}

augment mixin M {
  augment static late String staticVariable = "Augmented";
  augment static late final String finalStaticVariable = "Augmented";
  augment late String instanceVariable = "Augmented";
  augment late final String finalInstanceVariable = "Augmented";
}

augment enum E {
  augment e0;
  augment static late String staticVariable = "Augmented";
  augment static late final String finalStaticVariable = "Augmented";
}

augment extension Ext {
  augment static late String staticVariable = "Augmented";
  augment static late final String finalStaticVariable = "Augmented";
}

augment extension type ET {
  augment static late String staticVariable = "Augmented";
  augment static late final String finalStaticVariable = "Augmented";
}
