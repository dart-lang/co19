// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The effect of a type alias of the form typedef id = T; declared in
/// a library L is to introduce the name id into the scope of L, bound to the
/// type T .
/// @description Checks that it is not an error if type alias id shadows type
/// alias with the same id in imported library
/// @author sgrekhov@unipro.ru
/// @issue 42640

import "scope.lib.dart";

typedef AAlias = A;
typedef CAlias<T> = C<T>;

main() {
}
