/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter cannot be used as a generic type
 * @description Checks that function type parameter cannot be used as a generic
 * type
 * @compile-error
 * @author iarkh@unipro.ru
 */

class A<T> {}

void func<X extends A>(dynamic d) {
  X<int> x = d;
}

main() {
}
