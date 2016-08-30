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
  p.foo;      /// 01: runtime error
  p.Func;     /// 02: runtime error
  p.SomeClass; /// 03: runtime error
  p.someGetter; /// 04: runtime error
  p.someSetter = 0; /// 05: runtime error
  p.someVar; /// 06: runtime error
  p.someFunc(); /// 07: runtime error
  p.loadLibrary();
}
