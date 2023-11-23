// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion noSuchMethod method
//     dynamic noSuchMethod(
//        Invocation invocation
//     )
/// Invoked when a non-existent method or property is accessed.
/// @description Checks that [NoSuchMethodError] is thrown if non-existing
/// method or property is accessed.
/// @author iarkh@unipro.ru

import '../../../../Utils/expect.dart';

dynamic finalizer = Finalizer((_) { throw "Should not reach here"; });

main() {
  Expect.throws(() {
    finalizer.unexisting();
  }, (e) => e is NoSuchMethodError);

  Expect.throws(() {
    finalizer.property;
  }, (e) => e is NoSuchMethodError);
}
