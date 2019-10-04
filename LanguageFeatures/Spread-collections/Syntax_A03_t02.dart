/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This grammar is ambiguous in cases like [{ ...a }] because
 * [mapLiteral], [setLiteral], and [mapOrSetLiteral] all match. In cases of
 * ambiguity like this, [mapOrSetLiteral] is always chosen. Then the
 * disambiguation happens based on the static types, below. It is not ambiguous
 * if the collection has any type arguments. If there is one, it's a set. If
 * two, a map. Otherwise, it's an error.
 * @description Checks that it is a set if collection has one type argument, it
 * is a map if collection has two arguments and exception is thrown if there are
 * three or more type arguments.
 * @compile-error
 * @author iarkh@unipro.ru
 */

main() {
  var a = <int, int, int>{};
}
