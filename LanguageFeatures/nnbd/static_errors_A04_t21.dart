// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is
/// marked with a `late` or `external` modifier.
///
/// @description Check that it is not an error if a top level or static variable
/// with a non-nullable type has no initializer expression but is marked with a
/// `late` modifier. Test type `Never`.
/// @author sgrekhov@unipro.ru

late Never n1;

class C {
  static late Never n1;
  static late final Never n2;
}

main() {
  C();
}
