// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A final variable can be augmented with a non-final augmenting
/// variable, and that will not add any setter. An augmenting variable
/// declaration only affects the initializer expression, not setters.
///
/// @description Checks that a final `late` variable can be augmented with a
/// non-final `late` augmenting variable. Test the case when augmentation has
/// no initializing value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A04_t03.dart';

augment late String topLevelVariable;

augment class C {
  augment static late String staticVariable;
  augment late String instanceVariable;
}

augment mixin M {
  augment static late String staticVariable;
  augment late String instanceVariable;
}

augment enum E {
  augment e0;
  augment static late String staticVariable;
}

augment extension Ext {
  augment static late String staticVariable;
}

augment extension type ET(String _) {
  augment static late String staticVariable;
}
