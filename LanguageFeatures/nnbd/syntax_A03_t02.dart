/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of expressions is extended to allow any expression to
 * be suffixed with a !.
 *
 * @description Check that any expression can be suffixed with a !. Test type
 * aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
class C {}

typedef CAlias = C?;

test(C c) {}

main() {
  CAlias c = new C();
  test(c!);
}
