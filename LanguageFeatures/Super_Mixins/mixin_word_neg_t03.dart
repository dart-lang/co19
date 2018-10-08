/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixin word is a built-in identifier to avoid parsing
 * ambiguities. It does not need to be a reserved word. The identifier mixin was
 * made a built-in identifier in Dart 2.0
 *
 * @description Checks that the mixin word cannot be used as a type name
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

typedef mixin = int Function(Object a, Object b);

main() {
  mixin m;
}
