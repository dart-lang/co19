/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable, static variable, or
 * instance field with potentially non-nullable type has no initializer
 * expression and is not initialized in a constructor via an initializing formal
 * or an initializer list entry, unless the variable or field is marked with the
 * 'late' modifier.
 *
 * @description Check that it is not an error if a top level variable, static
 * variable, or instance field with potentially non-nullable type has no
 * initializer expression but marked with a 'late' modifier. Test FutureOr<F>
 * where F is a function type
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
  late FutureOr<Function> x3;
  late final FutureOr<Function> x4;
  covariant late FutureOr<Function> x5;

  static late FutureOr<Foo> x6;
  static late final FutureOr<Foo> x7;
  late FutureOr<Foo> x8;
  late final FutureOr<Foo> x9;
  covariant late FutureOr<Foo> x10;
}

main() {
}
