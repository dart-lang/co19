// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// ...
///   - Add initializers (and/or asserts) to the initializer list, as well as a
///     `super`  call at the end of the initializer list.
///
/// @description Checks that when bodies of augmenting constructors are executed
/// super parameters are not passed twice to a superinitializer (no attempt to
/// reinitialize a final variable already initialized by augmenting constructor)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A11_t03.dart';
import '../../Utils/expect.dart';

augment class C {
  augment C(super.x) {
    Expect.equals("x", x);
  }
}
