// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
/// ...
///   - Local variables in scope where augmented is evaluated are not in scope
///     for the execution of the augmented constructor's body.
///
/// @description Checks that it is a compile-time error if an introductory
/// constructor accesses local variables defined in an augmenting constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A13_t01_lib.dart';

class C {
  C() {
    x++;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    x++;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
