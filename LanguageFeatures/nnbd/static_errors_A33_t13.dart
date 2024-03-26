// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable
///
/// @description It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable. Test generic function
/// type
/// @author sgrekhov@unipro.ru

void foo<T>() {}
typedef void Foo<T>();

main() {
  Function f1 = foo;
  f1!;
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION

  Foo f2 = foo;
  f2!;
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION

  foo!<int>();
//   ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  foo!();
//   ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  f1!<int>();
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  f1!();
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  f2!();
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
