// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting initializer expressions replace the augmented
/// initializer.
///
/// @description Checks that augmenting initializer expressions replaces the
/// augmented initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_variables_A02_t01.dart';

augment String topLevelVariable = augmentingInitializer();
augment String finalTopLevelVariable = augmentingInitializer();

augment class C {
  augment static String staticVariable = augmentingInitializer();
  augment static final String finalStaticVariable = augmentingInitializer();
  augment String instanceVariable = augmentingInitializer();
  augment final String finalInstanceVariable = augmentingInitializer();
}

augment mixin M {
  augment static String staticVariable = augmentingInitializer();
  augment static final String finalStaticVariable = augmentingInitializer();
  augment String instanceVariable = augmentingInitializer();
  augment final String finalInstanceVariable = augmentingInitializer();
}

augment enum E {
  augment e0;
  augment static String staticVariable = augmentingInitializer();
  augment static final String finalStaticVariable = augmentingInitializer();
}

augment extension Ext {
  augment static String staticVariable = augmentingInitializer();
  augment static final String finalStaticVariable = augmentingInitializer();
}

augment extension type ET(String _) {
  augment static String staticVariable = augmentingInitializer();
  augment static final String finalStaticVariable = augmentingInitializer();
}
