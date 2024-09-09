// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmenting function does not have to pass the same arguments
/// to `augmented(…)` as were passed to it. It may invoke `augmented` once, more
/// than once, or not at all.
///
/// @description Checks that it's not an error if an augmenting function passes
/// different arguments to the `augmented` expression and calls it more than
/// once. Test operators.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A03_t12.dart';

augment class C {
  augment String operator +(String other) {
    _log += augmented + "a";
    _log += "augmented;";
    augmented + "b";
    return "C: augment other=$other";
  }
}

augment mixin M {
  augment String operator +(String other) {
    _log += augmented + "c";
    _log += "augmented;";
    augmented + "d";
    return "M: augment other=$other";
  }
}

augment enum E {
  augment e1;

  augment String operator +(String other) {
    _log += augmented + "e";
    _log += "augmented;";
    augmented + "f";
    return "E: augment other=$other";
  }
}

augment extension Ext {
  augment String operator +(String other) {
    _log += augmented + "g";
    _log += "augmented;";
    augmented + "h";
    return "Ext: augment other=$other";
  }
}
