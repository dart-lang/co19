// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting a variable with a variable: Augmenting a variable with
/// a variable only alters its initializer, metadata, or doc comments. As usual,
/// external and abstract variables cannot augment their initializing
/// expression, since it does not exist.
///
/// @description Checks that augmenting a variable with a variable alters its
/// initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_variables_A01_t01.dart';

augment String topLevelVariable = "Augmented";
augment String finalTopLevelVariable = "Augmented";

augment class C {
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
  augment String instanceVariable = "Augmented";
  augment final String finalInstanceVariable = "Augmented";
}

augment mixin M {
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
  augment String instanceVariable = "Augmented";
  augment final String finalInstanceVariable = "Augmented";
}

augment enum E {
  augment e0;
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
  augment final String finalInstanceVariable = "Augmented";
}

augment extension Ext {
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
}

augment extension type ET(String _) {
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
}
