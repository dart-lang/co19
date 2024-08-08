// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable can be augmented with a non-final augmenting
/// variable, and that will not add any setter. An augmenting variable
/// declaration only affects the initializer expression, not setters.
///
/// @description Checks that if a final `late` variable is augmented with a
/// non-final `late` augmenting variable then it is still a compile-time error
/// to write to it.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A04_t05.dart';

augment late String topLevelVariable = "Augmented";

augment class C {
  augment static late String staticVariable = "Augmented";
  augment late String instanceVariable = "Augmented";
}

augment mixin M {
  augment static late String staticVariable = "Augmented";
  augment late String instanceVariable = "Augmented";
}

augment enum E {
  augment e0;
  augment static late String staticVariable = "Augmented";
}

augment extension Ext {
  augment static late String staticVariable = "Augmented";
}

augment extension type ET {
  augment static late String staticVariable = "Augmented";
}
