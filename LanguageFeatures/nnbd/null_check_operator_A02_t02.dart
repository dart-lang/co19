/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws no runtime error if v is not null. Test function type
 * @author sgrekhov@unipro.ru
 * @issue 39723
 * @issue 39758
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

Object? foo(int i) => "Lily was here";
Object? bar<T>(T t) => 42;

main() {
  Function? f1 = foo;
  f1!(42);
  if (f1 != null) {
      f1(42)!;
  }

  Function? f2 = bar;
  f2!<int>(42);
  if (f2 != null) {
    f2<int>(42)!;
  }
}
