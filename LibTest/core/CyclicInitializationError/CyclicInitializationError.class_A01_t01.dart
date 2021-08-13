// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Error thrown when a lazily initialized variable cannot be
/// initialized.
/// A static/library variable with an initializer expression is initialized the
/// first time it is read. If evaluating the initializer expression causes
/// another read of the variable, this error is thrown.
/// @description Checks that if evaluating the initializer expression causes
/// another read of the variable, then CyclicInitializationError is thrown.
/// Test static variable
///
/// @note: there should be a CyclicInitializationError in legacy code, and this
/// is not so for opted out code, see
/// https://github.com/dart-lang/sdk/issues/42893#issuecomment-668452162
///
/// @Issue 22141, 42470, 42893
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class C {
  static var x = f();
  static f() => x + 1;
}

main() {
  Expect.throws(() { C.x; }, (e) => e is CyclicInitializationError);
}
