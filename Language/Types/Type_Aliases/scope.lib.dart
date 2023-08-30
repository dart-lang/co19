// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The effect of a type alias of the form typedef id = T; declared in
/// a library L is to introduce the name id into the scope of L, bound to the
/// type T .
/// @description Checks that type alias of the form typedef id = T; introduces
/// the name id into the scope of L, bound to the type T .
/// @author sgrekhov@unipro.ru

library scope_lib;

class A {}
class C<T> {}

typedef AAlias = A;
typedef CAlias<T> = C<T>;
