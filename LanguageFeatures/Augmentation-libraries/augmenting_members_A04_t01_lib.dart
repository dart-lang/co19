// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable can be augmented with a non-final augmenting
/// variable, and that will not add any setter. An augmenting variable
/// declaration only affects the initializer expression, not setters.
///
/// @description Checks that a final variable can be augmented with a non-final
/// augmenting variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A04_t01.dart';

augment String topLevelVariable = "Augmented";

augment class C {
  augment static String staticVariable = "Augmented";
  augment String instanceVariable = "Augmented";
}

augment mixin M {
  augment static String staticVariable = "Augmented";
  augment String instanceVariable = "Augmented";
}

augment enum E {
  augment e0;
  augment static String staticVariable = "Augmented";
  augment String instanceVariable = "Augmented";
}

augment extension Ext {
  augment static String staticVariable = "Augmented";
}

augment extension type ET {
  augment static String staticVariable = "Augmented";
}
