// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting setter declaration may have an empty body (`;`) in
/// order to only augment the metadata or doc comments of the setter. In this
/// case the body of the augmented setter is not altered.
///
/// @description Checks that if an augmenting setter has no body then the body
/// of the augmented setter is not altered.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_setters_A02_t01.dart';

void set topLevelSetter(int v);

augment class C {
  augment static void set staticSetter(int v);
  augment void set instanceSetter(int v);
}

augment mixin M {
  augment static void set staticSetter(int v);
  augment void set instanceSetter(int v);
}

augment enum E {
  augment e0;
  augment static void set staticSetter(int v);
  augment void set instanceSetter(int v);
}

augment extension Ext {
  augment static void set staticSetter(int v);
  augment void set instanceSetter(int v);
}

augment extension type ET {
  augment static void set staticSetter(int v);
  augment void set instanceSetter(int v);
}
