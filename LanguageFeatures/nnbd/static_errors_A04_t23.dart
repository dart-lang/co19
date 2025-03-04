// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is
/// marked with a `late` or `external` modifier.
///
/// @description Check that it is not an error if a top level or static variable
/// with a non-nullable type has no initializer expression but is marked with a
/// `late` modifier. Test a function type.
/// @author sgrekhov@unipro.ru

typedef void Foo();

late Foo x1;

class C {
  static late Foo x1;
  static late final Foo x2;
}

main() {
  new C();
}
