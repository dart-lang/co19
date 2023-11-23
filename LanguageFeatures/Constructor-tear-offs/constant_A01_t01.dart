// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression is constant if it is an explicit generic type
/// instantiation of a constant function object where the type argument is
/// constant
///
/// @description Check that an expression is constant if it is an explicit
/// generic type instantiation of a constant function object where the type
/// argument is constant
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

X f<X>(X x) => x;

typedef IntAlias = int;

void main() {
  const c1 = f<int>;
  Expect.equals(42, c1(42));

  const c2 = f<IntAlias>;
  Expect.equals(42, c2(42));
}