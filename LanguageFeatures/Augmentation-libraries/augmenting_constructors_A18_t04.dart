// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has any initializers or a body.
///
/// @description Checks that it is not an error to declare an augmenting
/// redirecting generative constructor more than once and the fully merged
/// constructor has no errors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_constructors_A18_t04_lib.dart';
import '../../Utils/expect.dart';

class C {
  int x;
  C(this.x);
  C.foo(int x);
}

main() {
  Expect.equals(2, C.foo(1));
}
