/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type is a type which is introduced by a generic class
 * declaration or a generic type alias, or it is the type [FutureOr].
 * @description Checks that exception is thrown when try to use non-generic
 * typedef with type parameter.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {}
typedef AAlias = A;

main() {
  AAlias a = AAlias();

  AAlias<int> a1;                    //# 01: compile-time error
  AAlias a2 = AAlias<int>();         //# 02: compile-time error

  AAlias<dynamic> a3;                //# 03: compile-time error
  AAlias a4 = new AAlias<dynamic>(); //# 04: compile-time error
}
