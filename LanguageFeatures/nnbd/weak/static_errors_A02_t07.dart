// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to read a field or tear off a method from an
/// expression whose type is potentially nullable and not dynamic, except for the
/// methods and fields on Object.
///
/// @description Check that it is no compile-time error to tear off a method
/// from an expression if this is a method or field on Object. Test class
/// FutureOr
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "dart:async";
import "../../../Utils/expect.dart";

class C {}

main() {
  FutureOr x1 = new Object();
  Expect.isNotNull(x1.toString);

  FutureOr<void> x2 = new Object();
  Expect.isNotNull(x2.toString);

  FutureOr<Null> x3 = null;
  Expect.isNotNull(x3.toString);

  FutureOr<C?> x4 = new C();
  Expect.isNotNull(x4.toString);

  var x6 = new C();
  Expect.isNotNull(x6.toString);
}
