// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The resulting constructor is not valid (has a redirecting initializer and
///   other initializers, multiple super initializers, etc).
///
/// @description Checks that it is a compile-time error if the resulting
/// constructor has a redirecting initializer and other initializers.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A06_t01.dart';

augment class C {
  augment C.foo(): x = 1;
}
