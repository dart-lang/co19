// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error to declare a non-function type
/// alias with a type parameter whose bound is a top type
/// @author iarkh@unipro.ru

class A<T> {}

typedef Void = void;

typedef B1<X extends Object?> = A<X>;
typedef B2<X extends dynamic> = A<X>;
typedef B3<X extends Void> = A<X>;

main() {
  print(B1);
  print(B2);
  print(B3);
}
