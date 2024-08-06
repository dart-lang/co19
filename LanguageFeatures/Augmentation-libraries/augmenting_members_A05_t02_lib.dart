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
/// @description Checks that it is still a compile-time error to have a final
/// variable with no initializer.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_members_A05_t02.dart';

augment final String? topLevelVariable;

augment class C {
  augment static final String? staticVariable;
  augment final String? instanceVariable;
}

augment mixin M {
  augment static final String? staticVariable;
  augment final String? instanceVariable;
}

augment enum E {
  augment e0;
  augment static final String? staticVariable;
  augment final String? instanceVariable;
}

augment extension Ext {
  augment final static String? staticVariable;
}

augment extension type ET {
  augment final static String? staticVariable;
}
