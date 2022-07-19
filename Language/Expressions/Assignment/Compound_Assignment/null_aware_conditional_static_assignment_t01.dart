// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compound assignment of the form C?.v ??= e2 is equivalent to the
/// expression C.v ??= e.
/// @description Checks that in expression of the form C?.v ??= e value is set
/// only if C.v == null
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C {
  static var v = null;
}

main() {
  C.v = null;
  C?.v ??= 1;
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] The class 'C' cannot be null.
  Expect.equals(1, C.v);

  C?.v ??= 2;
// ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//^
// [cfe] The class 'C' cannot be null.
  Expect.equals(1, C.v);
}
