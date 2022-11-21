// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is marked
/// with the `late` modifier.
///
/// @description Check that it is not an error if a top level or static
/// variable with potentially non-nullable type has no initializer expression
/// but marked with a 'late' modifier. Test FutureOr<Never>
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "dart:async";
late FutureOr<Never> x;

class C {
  static late FutureOr<Never> x1;
  static late final FutureOr<Never> x2;
}

main() {
  new C();
}
