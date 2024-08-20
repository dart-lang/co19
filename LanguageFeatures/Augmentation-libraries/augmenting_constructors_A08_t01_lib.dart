// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A redirecting constructor augments a constructor which is not potentially
///   redirecting.
///
/// @description Checks that it is a compile-time error if a redirecting
/// constructor augments a constructor which is not potentially redirecting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_constructors_A08_t01.dart';

augment class C {
  augment C.foo(): this(0);
}
