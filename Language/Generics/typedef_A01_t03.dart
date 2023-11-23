// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
/// ...
/// where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
/// empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
/// [dynamic]. The associated type of [D], call it [F], is, respectively:
///   T
/// ...
/// @description Checks that exception is thrown if generic metadata is incorrect
/// @author iarkh@unipro.ru

class A() {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
class C<T> {}
@A()  typedef CAlias<T> = C<T>;
//^
// [analyzer] unspecified
// [cfe] unspecified
main() {}
