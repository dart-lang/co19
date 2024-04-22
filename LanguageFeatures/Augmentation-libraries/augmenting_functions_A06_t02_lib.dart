// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmenting declaration uses augmented when the original declaration has
///   no concrete implementation. Note that all external declarations are
///   assumed to have an implementation provided by another external source, and
///   they will throw a runtime exception when called if not.
///
/// @description Checks that it is not an error if an augmenting
/// declaration uses `augmented` when the original declaration is an `external`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A06_t02.dart';

augment external void topLevelFunction() {
  augmented();
}

augment class C {
  augment static void staticMethod() {
    augmented();
  }
  augment void instanceMethod() {
    augmented();
  }
}

augment mixin M {
  augment static void staticMethod() {
    augmented();
  }
  augment void instanceMethod() {
    augmented();
  }
}

augment enum E {
  augment e1;

  augment static void staticMethod() {
    augmented();
  }
  augment void instanceMethod() {
    augmented();
  }
}

augment extension Ext {
  augment static void staticMethod() {
    augmented();
  }
  augment void instanceMethod() {
    augmented();
  }
}
