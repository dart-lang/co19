// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type [T] which is not well-bounded is a
/// compile-time error.
/// @description Checks that compile error is thrown when function alias with not
/// well bounded type parameter is declared
/// @Issue 37031
/// @author iarkh@unipro.ru


class A<T extends A<T>> {}

typedef B1<X extends A>     = void Function();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B2<X extends A<A>>  = void Function();
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B3<X extends A>     = void Function();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B4<X extends A<int>>  = void Function();
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef B5<X extends A>       = X Function();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B6<X extends A<A>>    = X Function();
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B7<X extends A>       = X Function();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B8<X extends A<int>>  = X Function();
//                     ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef B9<X extends A>       = void Function(X);
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B10<X extends A<A>>   = void Function(X);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B11<X extends A>      = void Function(X);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B12<X extends A<int>> = void Function(X);
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef B13<X extends A>      = void Function<X1 extends X>();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B14<X extends A<A>>   = void Function<X1 extends X>();
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B15<X extends A>      = void Function<X1 extends X>();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B16<X extends A<int>> = void Function<X1 extends X>();
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef B17<X extends A>      = X Function(X);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B18<X extends A<A>>   = X Function(X);
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B19<X extends A>      = X Function(X);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
typedef B20<X extends A<int>> = X Function(X);
//                      ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
