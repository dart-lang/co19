// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of a conditional ordinary method invocation e of the
/// form o?.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k)
/// is equivalent to the evaluation of the expression
/// ((x) => x == null?null : x.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k))(o).
/// unless o is a type literal, in which case it is equivalent to
/// o.m(a1, ..., an, xn+1 : an+1, ..., xn+k : an+k).
/// @description Check that for static method o?.m() is equivalent to o.m()
/// @author sgrekhov@unipro.ru

import '../../../../Utils/expect.dart';

class C {
  static String m() => "id";
}

main() {
  Expect.equals(C?.m(), C.m());
//               ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
}
