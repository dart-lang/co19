/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The implicit tear-off conversion which converts uses of instances
 * of classes with call methods to the tear-off of their .call method when the
 * context type is a function type is performed when the context type is a
 * function type, or the nullable version of a context type.
 *
 * @description Check that the implicit tear-off conversion which converts uses
 * of instances of classes with call methods to the tear-off of their .call
 * method when the context type is a function type is performed when the context
 * type is a function type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "../../Utils/expect.dart";

typedef int Foo();

class C {
  int call() => 42;
}

main() {
  C c = new C();
  Function f = c;
  Expect.equals(42, f());

  test(c);
}

test(Foo f) {
  Expect.equals(42, f());
}
