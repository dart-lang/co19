/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a constant constructor is declared
 * by a class C if any instance variable declared in C is initialized with an
 * expression that is not a constant expression.
 * A superclass of C cannot declare such an initializer either, because it must
 * necessarily declare constant constructor as well (unless it is Object, which declares
 * no instance variables)
 * @description Checks that compile error is produced if class declares a
 * constant constructor and its superclass has instance variable initialized
 * by non-constant expression. Test type alias
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class A {
}

class B {
  final x = new A();
}
typedef BAlias = B;

class C extends BAlias {
  final y = 1;
  const C();
}

main() {
  const C();
}
