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
 * successive ? operators on a type. Test legacy pre-NNBD types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

class B<X extends A??> {}
//                  ^
// [analyzer] unspecified
// [cfe] unspecified

test(A?? a) {}
//     ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A?? a = null;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
