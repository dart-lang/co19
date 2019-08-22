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
 * FutureOr<S> where S is non-nullable. Test legacy pre-NNBD types and type
 * aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
import "dart:async";
import "legacy_library_aliases_lib.dart";

typedef AAlias2 = A;

main() {
  FutureOr<AAlias> fo = null;
//                      ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  FutureOr<AAlias2> fo2 = null;
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
