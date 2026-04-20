// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement with no expression,` return;`
/// returns without an object.
///
/// @description Checks that a return statement of the form `return;` in a
/// generative constructor will complete the execution of the body such that
/// subsequent code (like `x = 1;`) will not be executed.
/// @author vasya

import '../../../Utils/expect.dart';

class C1 {
  int? x;
  C1() {
    if (2 > 1) {
      return;
    }
    x = 1;
  }
}

class C2 {
  int? x;
  C2() : super() {
    if (2 > 1) {
      return;
    }
    x = 1;
  }
}

main() {
  Expect.isNull(C1().x);
  Expect.isNull(C2().x);
}
