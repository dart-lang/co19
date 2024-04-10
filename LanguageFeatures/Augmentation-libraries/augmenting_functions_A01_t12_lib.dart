// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A top-level function, static method, instance method, or operator
/// may be augmented to wrap the original code in additional code. The
/// augmentation replaces the original function body with the augmenting code.
///
/// @description Checks that an operator may be augmented and the original code
/// is replaced by the augmentation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A01_t12.dart';

augment class C {
  augment String operator +(String other) {
    _log += "C: augment operator +($other);";
    return "C: augment other=$other";
  }
}

augment mixin M {
  augment String operator +(String other) {
    _log += "M: augment operator +($other);";
    return "M: augment other=$other";
  }
}

augment enum E {
  augment e1;

  augment String operator +(String other) {
    _log += "E: augment operator +($other);";
    return "E: augment other=$other";
  }
}

augment extension Ext {
  augment String operator +(String other) {
    _log += "Ext: augment operator +($other);";
    return "Ext: augment other=$other";
  }
}
