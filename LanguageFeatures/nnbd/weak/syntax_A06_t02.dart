// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar of selectors is extended to allow null-aware
/// subscripting using the syntax e1?[e2] which evaluates to null if e1
/// evaluates to null and otherwise evaluates as e1[e2].
///
/// @description Check that the grammar of selectors is extended to allow
/// null-aware subscripting using the syntax e1?[e2] which evaluates to null if
/// e1 evaluates to null and otherwise evaluates as e1[e2]. Test type aliases
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import '../../../Utils/expect.dart';

class C {
  int operator[](int index) => index * 2;
}

typedef CAlias = C?;
CAlias c = null;
CAlias c1 = C();

main() {
  Expect.isNull(c?[42]);
  Expect.equals(4, c1?[2]);
}
