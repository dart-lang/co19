// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is
/// marked with a `late` or `external` modifier.
///
/// @description Check that it is an error if a top level or static variable
/// with a non-nullable type has no initializer expression and is not marked
/// with a `late` or `external `modifier. Test type `Function`.
/// @author sgrekhov@unipro.ru

Function f;
//       ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static Function f1;
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
