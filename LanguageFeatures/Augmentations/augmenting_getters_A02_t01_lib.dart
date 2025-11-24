// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting getter declaration may have an empty body (`;`) in
/// order to only augment the metadata or doc comments of the getter. In this
/// case the body of the augmented getter is not altered.
///
/// @description Checks that if an augmenting getter has no body then the body
/// of the augmented getter is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_getters_A02_t01.dart';

augment String get topLevelGetter;

augment class C {
  augment static String get staticGetter;
  augment String get instanceGetter;
}

augment mixin M {
  augment static String get staticGetter;
  augment String get instanceGetter;
}

augment enum E {
  augment e0;
  augment static String get staticGetter;
  augment String get instanceGetter;
}

augment extension Ext {
  augment static String get staticGetter;
  augment String get instanceGetter;
}

augment extension type ET {
  augment static String get staticGetter;
  augment String get instanceGetter;
}
