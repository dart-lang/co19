// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting function declaration may have an empty body (`;`)
/// in order to only augment the metadata or doc comments of the function. In
/// this case the body of the augmented member is not altered.
///
/// @description Checks that if an augmenting function declaration has an empty
/// body then the body of the augmented member is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A07_t01.dart';

augment String topLevelFunction();

augment class C {
  augment static String staticMethod();
  augment String instanceMethod();
}

augment mixin M {
  augment static String staticMethod();
  augment String instanceMethod();
}

augment enum E {
  augment e1;

  augment static String staticMethod();
  augment String instanceMethod();
}

augment extension Ext {
  augment static String staticMethod();
  augment String instanceMethod();
}

augment extension type ET {
  augment static String staticMethod();
  augment String instanceMethod();
}
