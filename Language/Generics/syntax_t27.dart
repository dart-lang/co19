// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
/// ...
/// where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
/// empty string.
/// @description Checks that constant generic class constructor can be used as
/// metadata with type parameter set or not set when generic metadata feature
/// gets enabled.
/// @author iarkh@unipro.ru


class A<X> { const A(); }
class C<T> { const C(); }

typedef CAlias<X> = C<X>;

@CAlias() typedef G = void Function();
@CAlias<int>() typedef K = void Function();

main() {}
