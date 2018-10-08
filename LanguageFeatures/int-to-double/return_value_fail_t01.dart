/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a double valued integer literal is [double]
 * @description Checks that the static type of a double valued integer literal
 * is [double]. Test that it is a compile error if int is not assignable to
 * type X
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C<X extends num> {
  X get instanceGetter => 42;       //# 01: compile-time error
  X get instanceGetter => 0x42;     //# 02: compile-time error
  X instanceMethod() => 42;         //# 03: compile-time error
  X instanceMethod() => 0x42;       //# 04: compile-time error
}

X foo<X extends num>() => 42;       //# 05: compile-time error
X foo<X extends num>() => 0x42;     //# 06: compile-time error

main() {
  C<double> c = new C<double>();
  foo<double>();                    //# 05: compile-time error
  foo<double>();                    //# 06: compile-time error
}
