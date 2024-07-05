// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In all relevant cases, if the augmented member is an instance
/// member, it is invoked with the same value for `this`.
///
/// @description Checks that if the augmented member is an instance member, it
/// is invoked with the same value for `this`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A07_t01.dart';
import '../../Utils/expect.dart';

augment class C {
  augment C test() {
    Expect.identical(this, augmented());
    return this;
  }
}

augment mixin M {
  augment M test() {
    Expect.identical(this, augmented());
    return this;
  }
}

augment enum E {
  augment e0;
  augment E test() {
    Expect.identical(this, augmented());
    return this;
  }
}

augment extension Ext {
  augment A test() {
    Expect.identical(this, augmented());
    return this;
  }
}
