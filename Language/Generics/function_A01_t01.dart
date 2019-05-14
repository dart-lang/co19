/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type is a type which is introduced by a generic class
 * declaration or a generic type alias, or it is the type [FutureOr].
 * @description Checks that exception is thrown when try to call non-generic
 * function with type parameter.
 * @author iarkh@unipro.ru
 */

void testme() {}

main() {
  testme();
  testme<dynamic>();     //# 01: compile-time error
  testme<int, String>(); //# 02: compile-time error
  testme<Null>();        //# 03: compile-time error
}
