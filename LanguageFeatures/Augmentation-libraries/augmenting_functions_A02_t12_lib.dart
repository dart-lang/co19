// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Inside the augmenting function’s body, a special `augmented(…)`
/// expression may be used to execute the augmented function body. That
/// expression takes an argument list matching the augmented function's
/// parameter list, and it has the same return type as the enclosing function.
///
/// @description Checks that inside an augmentation body of an operator
/// `augmented` expression executes the body of the original operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_functions_A02_t12.dart';

augment class C {
  augment String operator +(String other) {
    _log += augmented + other;
    _log += "augmented;";
    return "C: augment other=$other";
  }
}

augment mixin M {
  augment String operator +(String other) {
    _log += augmented + other;
    _log += "augmented;";
    return "M: augment other=$other";
  }
}

augment enum E {
  augment e1;

  augment String operator +(String other) {
    _log += augmented + other;
    _log += "augmented;";
    return "E: augment other=$other";
  }
}

augment extension Ext {
  augment String operator +(String other) {
    _log += augmented + other;
    _log += "augmented;";
    return "Ext: augment other=$other";
  }
}
