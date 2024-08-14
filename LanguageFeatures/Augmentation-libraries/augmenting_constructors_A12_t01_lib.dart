// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
/// ...
///   - Initializer lists are not re-run, they have already executed and
///     shouldn't be executed twice. The same goes for initializing formals and
///     super parameters.
///
/// @description Checks that if a parameter variable is overwritten prior to
/// calling `augmented()`, the augmented body see the updated value.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A12_t01.dart';

augment class C {
  augment C(String v1, [String v2]) {
    v1 = "Augmented";
    v2 = "Augmented";
    augmented();
  }
}
