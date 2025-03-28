// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a mixin declaration or a class declaration with
/// no generative constructors declares an instance variable without an
/// initializing expression which is final or whose type is potentially
/// non-nullable, unless the variable is marked with a `late`, `abstract`, or
/// `external` modifier.
///
/// @description Check that it is an error if a class declaration with no
/// generative constructors declares an instance variable with a potentially
/// non-nullable type and no initializing expression. Test type
/// `FutureOr<Never>`.
/// @author sgrekhov@unipro.ru
/// @issue 40677
/// @issue 40940

import "dart:async";

class C {
  FutureOr<Never> n;
//                ^
// [analyzer] unspecified
// [cfe] unspecified
  factory C.f() = D;
}

class D implements C {
  FutureOr<Never> n;
//                ^
// [cfe] unspecified

  D();
//^
// [analyzer] unspecified
}

main() {
  print(C);
}
