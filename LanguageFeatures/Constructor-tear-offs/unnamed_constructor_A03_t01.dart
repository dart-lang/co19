// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Apart from the tear-off, this code will mean exactly the same
/// thing as the same code without the .new.
///
/// @description Checks that [new] call is equivalent with the default
/// constructor call. Tests non-generic class.
///
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A {
  static int called = 0;
  A() {
    called++;
  }
}

main() {
  A.new();
  Expect.equals(1, A.called);

  A();
  Expect.equals(2, A.called);

  A.new();
  Expect.equals(3, A.called);
}
