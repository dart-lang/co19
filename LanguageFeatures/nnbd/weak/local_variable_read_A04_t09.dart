// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is definitely unassigned unless the variable is non-final, and
/// non-late, and has nullable type.
///
/// @description Checks that it's not an error to read definitely unassigned
/// local non-final non-late variable which has a nullable type
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

main() {
  int? x1;
  Expect.isNull(x1);
}
