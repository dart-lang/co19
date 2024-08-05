// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting initializer expressions replace the augmented
/// initializer (or provide one where none existed previously).
///
/// @description Checks that augmenting initializer expressions may provide the
/// initializer if it did not exist.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_variables_A02_t02.dart';

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
}

augment extension Ext {
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
}

augment extension type ET {
  augment static String staticVariable = "Augmented";
  augment static final String finalStaticVariable = "Augmented";
}
