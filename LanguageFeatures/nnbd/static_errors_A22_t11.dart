/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T is non-nullable if T <: Object. This is
 * equivalent to the syntactic criterion that T is any of:
 *  Never
 *  Any function type (including Function)
 *  Any interface type except Null.
 *  S* for some S where S is non-nullable
 *  FutureOr<S> where S is non-nullable
 *  X extends S where S is non-nullable
 *  X & S where S is non-nullable
 *
 * @description Check that null cannot be assigned to non-nullable type. Test
 * X & S where S is non-nullable. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases

class S {}

typedef SAlias = S;

dynamic getDynamic(dynamic v) => v;

main() {
  var v = getDynamic(new S());
  if (v is SAlias) {
    v = null;
//      ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
