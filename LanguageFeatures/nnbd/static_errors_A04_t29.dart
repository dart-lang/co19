/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable or static variable with a
 * non-nullable type has no initializer expression unless the variable is marked
 * with the `late` modifier.
 *
 * @description Check that it is not an error if a top level or static
 * variable  with potentially non-nullable type has no initializer expression
 * but marked with a 'late' modifier. Test FutureOr<F> where F is a function
 * type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";
typedef void Foo();

late FutureOr<Function> f1;
late FutureOr<Foo> f2;

class C {
  static late FutureOr<Function> x1;
  static late final FutureOr<Function> x2;

  static late FutureOr<Foo> x3;
  static late final FutureOr<Foo> x4;
}

main() {
  new C();
}
