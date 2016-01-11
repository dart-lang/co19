/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the implements clause of a class C
 * specifies an enumerated type, a malformed type or deferred type
 * as a superinterface
 * @description Checks that it is a compile-time error when the type expression
 * in a class's implements clause denotes an enumerated type
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

enum E {a, b, c}

class A implements E {}

main() {
  new A();
}
