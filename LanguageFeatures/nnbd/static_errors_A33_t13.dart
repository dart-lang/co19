/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a warning to use the null check operator (!) on an
 * expression of type T if T is strictly non-nullable
 *
 * @description It is a warning to use the null check operator (!) on an
 * expression of type T if T is strictly non-nullable. Test generic function
 * type
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
void foo<T>() {}
typedef void Foo<T>();

main() {
  Function f1 = foo;
  f1!;          //# 01: static type warning

  Foo f2 = foo;
  f2!;          //# 02: static type warning

  foo!<int>();  //# 03: static type warning
  foo!();        //# 04: static type warning
  f1!<int>();   //# 05: static type warning
  f1!();        //# 06: static type warning
  f2!();        //# 07: static type warning
}
