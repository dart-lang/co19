// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that augmenting constructor may add initializers to the
/// initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A11_t01.dart';
import '../../Utils/expect.dart';

augment class C {
  augment C(): y = "Augmented" {
    Expect.equals("Original", x);
    Expect.equals("Augmented", y);
    x = "x";
    y = "y";
  }
}

augment enum E {
  augment e0;
  augment const E(): y = "Augmented";
}

augment extension type ET {
  augment ET.foo() : assert(v > 0);
}
