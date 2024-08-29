// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a non-abstract, non-external variable is augmented by an
/// augmenting getter or setter, you can still augment the variable, as you are
/// only augmenting the initializer, metadata, or doc comments of the augmented
/// variable. This is not considered to be augmenting the augmenting getter or
/// setter, since those are not actually altered.
///
/// @description Checks that it is not an error to augment a variable by a
/// setter and than by a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_getters_setters_with_variable_A02_t02.dart';

augment String topLevelVariable = "Augmented2: $augmented";

augment class C {
  augment static String staticVariable = "Augmented2: $augmented";
  augment String instanceVariable = "Augmented2: $augmented";
}

augment mixin M {
  augment static String staticVariable = "Augmented2: $augmented";
  augment String instanceVariable = "Augmented2: $augmented";
}

augment enum E {
  augment e0;
  augment static String staticVariable = "Augmented2: $augmented";
}

augment extension Ext {
  augment static String staticVariable = "Augmented2: $augmented";
}

augment extension type ET {
  augment static String staticVariable = "Augmented2: $augmented";
}
