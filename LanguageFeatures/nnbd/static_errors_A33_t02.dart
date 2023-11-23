// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable
///
/// @description It is a warning to use the null check operator (!) on an
/// expression of type T if T is strictly non-nullable. Test function type
/// @author sgrekhov@unipro.ru
/// @issue 39598


void foo() {}
typedef void Foo();

main() {
  Function f1 = foo;
  f1!;
//^
// [cfe] Operand of null-aware operation '!' has type 'Function' which excludes null.
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION

  Foo f2 = foo;
  f2!;
//^
// [cfe] Operand of null-aware operation '!' has type 'void Function()' which excludes null.
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
