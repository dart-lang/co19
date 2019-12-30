/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar for types does not allow multiple successive ?
 * operators on a type. That is, the grammar for types is nominally equivalent
 * to:
 *  type' ::= functionType
 *  | qualified typeArguments?
 *  type ::= type' `?`?
 *
 * @description Check that the grammar for types does not allow multiple
 * successive ? operators on a type. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable,nonfunction-type-aliases
// Requirements=nnbd-strong
class A {}

typedef AAlias = A;

typedef AAlias2 = A??;
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

class C<X extends AAlias??> {}
//                       ^
// [analyzer] unspecified
// [cfe] unspecified

test(AAlias?? a) {}
//          ^
// [analyzer] unspecified
// [cfe] unspecified


main() {
  AAlias?? a = null;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}
