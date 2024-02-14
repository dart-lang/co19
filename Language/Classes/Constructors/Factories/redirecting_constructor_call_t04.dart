// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the dynamic semantics, assume that k is a redirecting factory
/// constructor and k′ is the redirectee of k
/// ...
/// When the redirectee k′ is a generative constructor, let o be a
/// fresh instance of the class that contains k′. Execution of k then amounts to
/// execution of k′ to initialize o, governed by the same rules as an instance
/// creation expression. If k′ completed normally then the execution of k
/// completes normally returning o, otherwise k completes by throwing the
/// exception and stack trace thrown by k′.
///
/// @description Checks that if a call of the redirectee completes by throwing
/// an exception, the redirecting constructor call completes with the same
/// exception
/// @author sgrekhov22@gmail.com

import "../../../../Utils/expect.dart";

class F {
  factory F() = C;
}

class C implements F {
  C() {
    dynamic x = "42";
    int y = x;
  }
}

main() {
  try {
    C();
  } catch (e1) {
    try {
      F();
    } catch (e2) {
      Expect.equals(e1.toString(), e2.toString());
    }
  }
}
