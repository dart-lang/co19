// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error to declare a variable
/// with a type which ia a non-function type alias with is not a well-bounded
/// @Issue 37031
/// @author iarkh@unipro.ru

class A<T> {}

typedef B<X extends A<X>> = A<X>;

main() {
  B<A<int>> b1;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  B<A<A<A<B>>>> b2;
}
