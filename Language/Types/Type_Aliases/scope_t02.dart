// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The effect of a type alias of the form typedef id = T; declared in
/// a library L is to introduce the name id into the scope of L, bound to the
/// type T .
/// @description Checks that it is a compile error if id is not unique
/// @author sgrekhov@unipro.ru

class A {}
class C<T> {}

typedef AAlias = A;
typedef CAlias<T> = C<T>;

typedef AAlias = A;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef AAlias = C<String>;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef CAlias<T> = C<T>;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef CAlias = C<String>;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
typedef CAlias<T1, T2> = C<T1>;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
