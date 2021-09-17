// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For an expression of the form e<typeArgs>, which is not followed
/// by an argument list (that would turn it into a generic function invocation),
/// the meaning of e<typeArgs> depends on the expression e:
/// ...
/// - Otherwise the expression is a compile-time error.
/// This includes e having the static type dynamic or Function. We do not
/// support implicit or explicit instantiation of functions where we do not know
/// the number and bounds of the type parameters at compile-time.
/// It also includes e denoting a constructor. (We reserve this syntax for
/// denoting instantiation of generic constructors, should the language add
/// generic constructors in the future. Instead just write (C.name)<typeArgs> or
/// C<typeArgs>.name.)
///
/// @description Checks that it is a compile-time error if e has a type dynamic
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

T foo<T>(T t) => t;

main() {
  T bar<T>(T t) => t;

  dynamic func1 = foo;
  var c1 = func1<int>;
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic func2 = bar;
  var c2 = func2<int>;
//         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
