// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
/// Inside the augmentation body, a special augmented() expression may be used
/// to execute the original function body. That expression takes an argument
/// list matching the original function's parameter list and returns the
/// function's return type.
///
/// @description Checks that it's not an error if an augmenting function passes
/// different arguments to the `augmented` expression and calls it more than
/// once. Test operators.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A03_t12.dart';

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
