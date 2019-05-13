/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is also a compile-time error to subclass, mix-in or implement 
 * an enum or to explicitly instantiate an enum.
 * @description Checks that it is compile-time error to explicitly instantiate 
 * an enum. Test type alias
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
enum E {a, b, c}

typedef EAlias = E;

main() {
  E e = new EAlias();
}
