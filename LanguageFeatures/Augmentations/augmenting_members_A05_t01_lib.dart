// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// An augmenting variable’s initializing expression uses `augmented`, and the
/// stack of augmented declarations do not include a variable with an explicit
/// initializing expression. For nullable fields, the implicit null
/// initialization only happens if there is no explicit initializer after the
/// entire stack of augmentations has been applied.
///
/// @description Checks that for nullable fields, the implicit null
/// initialization happens if there is no explicit initializer after the entire
/// stack of augmentations has been applied.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_members_A05_t01.dart';

augment String? topLevelVariable;

augment class C {
  augment static String? staticVariable;
  augment String? instanceVariable;
}

augment mixin M {
  augment static String? staticVariable;
  augment String? instanceVariable;
}

augment enum E {
  augment e0;
  augment static String? staticVariable;
}

augment extension Ext {
  augment static String? staticVariable;
}

augment extension type ET {
  augment static String? staticVariable;
}
