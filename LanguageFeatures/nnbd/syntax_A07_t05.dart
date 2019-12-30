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
 * @description Check that it is no error to have multiple ? but not in the type
 * declaration
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class A {}

class C<T> {
  T? t;
}

main() {
  C<int?>();      // C.t has type int??, it's Ok
  C<A?>();        // C.t has type A??, it's Ok
}
