// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The token following a question mark dictates whether it's part of
/// a null-aware operation or the beginning of a new expression.
///
/// @description Checks usage of a null-aware expression when a set literal is
/// declared.
/// @author sgrekhov@unipro.ru
/// @issue 48004

import "../../Utils/expect.dart";

class C {
  var n1 = 1 as int?;
  static var n2 = 2 as int?;
  int? x = null;
}

main() {
  C? cn = null;

  var v1 = {cn?.x ?? 3, C?.n2, cn?.n1};
//                       ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [cfe] The class 'C' cannot be null.
  Expect.isTrue(v1 is Set);
  checkType(checkIs<Set>, true, v1);
  Expect.iterableEquals({3, 2, null}, v1);

  var c = C() as C?;

  var v2 = {c?.x ?? 3, C?.n2, c?.n1};
//                      ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                       ^
// [cfe] The class 'C' cannot be null.
  Expect.isTrue(v2 is Set);
  checkType(checkIs<Set>, true, v2);
  Expect.iterableEquals({3, 2, 1}, v2);

  var v3 = <int?>{c?.x ?? 3, C?.n2, c?.n1};
//                            ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                            ^
// [cfe] The class 'C' cannot be null.
  Expect.isTrue(v3 is Set);
  checkType(checkIs<Set>, true, v3);
  Expect.iterableEquals({3, 2, 1}, v3);

  var v4 = <int?>{c?.n1 ??= (c as C).x, c?.x ??= 4, C?.n2, c?.x ?? 3};
//                                                   ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                                                   ^
// [cfe] The class 'C' cannot be null.
  Expect.isTrue(v4 is Set);
  checkType(checkIs<Set>, true, v4);
  Expect.iterableEquals({1, 4, 2}, v4);
}
