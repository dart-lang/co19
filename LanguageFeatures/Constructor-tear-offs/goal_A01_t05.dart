// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The goal is that you can always tear off a constructor, then
/// invoke the torn off function and get the same result as invoking the
/// constructor directly. For a named constructor it means that
///
///  var v1 = C.name(args);
///  var v2 = (C.name)(args);
//
///  // and
///
///  var v3 = C<typeArgs>.name(args);
///  var v4 = (C<typeArgs>.name)(args);
///  var v5 = (C.name)<typeArgs>(args);
///
/// should always give equivalent values for [v1] and [v2], and for [v3], [v4]
/// and [v5].
///
/// @description Checks tear-offs that violate bounds
/// @author sgrekhov@unipro.ru
/// @issue 46896

class C<T extends num> {
  int? i;

  C() { i = 0; }

  C.constr2(int num, String str) { this.i = 2; }
  C.constr3() { i = 3; }
}

main() {
  C<dynamic>.constr2(1, "").i;
//^
// [analyzer] unspecified
// [cfe] unspecified
  (C<dynamic>.constr2)(1, "").i;
// ^
// [analyzer] unspecified
// [cfe] unspecified
  (C.constr2)<dynamic>(1, "").i;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

  C<dynamic>.constr3().i;
//^
// [analyzer] unspecified
// [cfe] unspecified
  (C<dynamic>.constr3)().i;
// ^
// [analyzer] unspecified
// [cfe] unspecified
  (C.constr3)<dynamic>().i;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}
