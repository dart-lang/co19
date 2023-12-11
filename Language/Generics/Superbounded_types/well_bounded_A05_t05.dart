// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error to declare a variable with a
/// type which is a non-function type alias with a well-bounded type parameter
/// @author iarkh@unipro.ru

class A<T> {}

typedef B1<X> = A<X>;

typedef B2<X extends A<X>> = A<X>;

main() {
  B1 b1;
  B1<A<dynamic>> b2;
  B1<A<Object?>> b3;
  B1<A<Null>> b4;
  B1<A<Never>> b5;
  B1<A<void>> b6;
  B2<A<A<A<B2>>>> b7;
}
