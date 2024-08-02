// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If no initializer is provided then the augmented initializer is
/// not altered.
///
/// @description Checks that if no initializer is provided then the augmented
/// initializer is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_variables_A03_t01.dart';

augment String topLevelVariable;
augment String finalTopLevelVariable;

augment class C {
  augment static String staticVariable;
  augment static final String finalStaticVariable;
  augment String instanceVariable;
  augment final String finalInstanceVariable;
}

augment mixin M {
  augment static String staticVariable;
  augment static final String finalStaticVariable;
  augment String instanceVariable;
  augment final String finalInstanceVariable;
}

augment enum E {
  augment e0;
  augment static String staticVariable;
  augment static final String finalStaticVariable;
  augment final String finalInstanceVariable;
}

augment extension Ext {
  augment static String staticVariable;
  augment static final String finalStaticVariable;
}

augment extension type ET {
  augment static String staticVariable;
  augment static final String finalStaticVariable;
}
