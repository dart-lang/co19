// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any self reference in a type alias, either directly or recursively
/// via another type declaration, is a compile-time error
/// @description Checks that any self reference in a type alias is a compile-time
/// error. Test recursive reference
/// @author sgrekhov@unipro.ru

class C<T1, T2> {}

typedef CAlias1<T1, T2> = C<T1, T2>;
typedef CAlias2<T1, T2> = CAlias1<T1, CAlias4>;
//^
// [analyzer] unspecified
// [cfe] unspecified
typedef CAlias3<T1, T2> = CAlias2<T1, T2>;
//^
// [analyzer] unspecified
typedef CAlias4<T1, T2> = CAlias3<T1, T2>;
//^
// [analyzer] unspecified

main() {
}
