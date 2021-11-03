// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a constructor has a named
/// super-parameter with name n and a super-constructor invocation with a named
/// argument with name n.
///
/// @description Check that it is no compile-time error if a constructor has a
/// named super-parameter with name n and a super-constructor invocation with no
/// named argument with name n.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class S {
  int? n;
  S({int? n}) : this.n = n;
}

class C extends S {
  int i1;
  C(this.i1, {super.n}): super();
}
main() {
  C c = C(1, n: 2);
  Expect.equals(1 ,c.i1);
  Expect.equals(2 ,c.n);
}
