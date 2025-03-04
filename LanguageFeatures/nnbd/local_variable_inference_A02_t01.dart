// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Local variables with no explicitly written type but with an
/// initializer are given an inferred type equal to the type of their
/// initializer, unless that type is Null, in which case the inferred type of the
/// variable shall be dynamic.
///
/// @description Checks that local variables with no explicitly written type but
/// with an initializer are given an inferred type equal to the type of their
/// initializer
/// @author sgrekhov@unipro.ru

class C {
  static void testStatic() {
    var x = 42;
    x.isEven;
  }

  test() {
    var x = 42;
    x.isEven;
  }
}

main() {
  var x = 42;
  x.isEven;

  C.testStatic();
  C().test();
}
