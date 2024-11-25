// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is
/// marked with a `late` or `external` modifier.
///
/// @description Check that it is not an error if a top level or static variable
/// with a non-nullable type has no initializer expression but is marked with an
/// `external` modifier. Test some class.
/// @author sgrekhov22@gmail.com

// Requirements=nnbd-strong

class A {}

external A x1;

class C {
  external static A x1;
  external static final A x2;
}

main() {
  new C();
}
