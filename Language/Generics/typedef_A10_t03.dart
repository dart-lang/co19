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
typedef void MyTypedef(int);

main() {
  MyTypedef a1;
  MyTypedef<int> a2;     //# 01: compile-time error
  MyTypedef<dynamic> a3; //# 02: compile-time error
  MyTypedef<String> a4;  //# 03: compile-time error
  MyTypedef<void> a5;    //# 04: compile-time error
}
