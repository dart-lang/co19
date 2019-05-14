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
typedef Alias1 = void Function(int);
typedef Alias2 = void Function<String>(int);

main() {
  Alias1 a1;
  Alias1<int> a2;     //# 01: compile-time error
  Alias1<dynamic> a3; //# 02: compile-time error

  Alias2 a4;
  Alias2<int> a5;     //# 03: compile-time error
  Alias2<String> a6;  //# 04: compile-time error
  Alias2<dynamic> a7; //# 05: compile-time error

}
