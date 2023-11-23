// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With unsound null checking, evaluation proceeds as follows:
///
/// First e is implicitly cast to bool if required (using
/// LEGACY_SUBTYPE(e.runtimeType, bool))
/// This cast may fail, and if so it is a TypeError.
/// If the cast does not fail, then the result may still be null, and so the
/// result must be checked against null.
/// If the null check fails, it is an AssertionError, otherwise evaluation of the
/// enclosing conditional proceeds as usual.
///
/// @description Checks that it is a TypeError if runtime check fails
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

main() {
  dynamic d = 42;
  Expect.throws(() {
    if(d) {}
  }, (e) => e is TypeError);

  d = new Object();
  Expect.throws(() {
    if(d) {}
  }, (e) => e is TypeError);
}
