// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor marked `augment` adds its
/// factory redirection (e.g., `= C<int>.name`) to the augmented constructor.
///
/// The result of applying the augmenting constructor is a redirecting factory
/// constructor with the same target constructor designation as the augmenting
/// constructor. This removes the potentially non-redirecting property of the
/// constructor.
///
/// @description Checks that a redirecting factory constructor marked `augment`
/// adds its factory redirection to the augmented constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A19_t01.dart';

augment class C {
  augment factory C.bar(int x, [int y]) = C;
  augment factory C.baz(int x, {int y}) = C.foo;
  augment factory C.qux(int x, [int y]) = D;
}

augment extension type ET {
  augment factory ET.bar(int x) = ET;
  augment factory ET.baz(int x) = ET.foo;
}
