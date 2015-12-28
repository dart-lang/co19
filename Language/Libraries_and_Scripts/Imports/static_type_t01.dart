/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of the prefix object p is a unique interface type
 * that has those members whose names and signatures are listed above.
 * @description Check that prefix p contains all functions, getters, setters and
 * declaration defined in the library and loadLibrary() method. So call of these
 * methods should not produce static warnings. Test deferred import
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

import "static_type_lib.dart" deferred as p;

main() {
  try {
    p.foo;
    p.Func;
    p.SomeClass;
    p.someGetter;
    p.someSetter = 0;
    p.someVar;
    p.someFunc();
    p.loadLibrary();
  } catch (e) {
  }
}
