/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class, let A be a superclass of C, and let S1...Sk
 * be superclasses of C that are also subclasses of A. C inherits all
 * accessible instance members of A that have not been overridden by a
 * declaration in C or in at least one of S1...Sk.
 * A class may override instance members that would otherwise have been
 * inherited from its superclass.
 * @description Checks that it is no compile error if you have a static member
 * named m in superclass and an instance member of the same name. Test type
 * aliases
 * @issue 27476
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class S {
  static var v;
  static int i;
  static method() {}
  static int iMethod() {}
}

typedef SAlias = S;

class C extends SAlias {
  v() {}
  i() {}
  method() {}
  iMethod() {}
}

main() {
  var c = new C();
  c.v();
  c.i();
  c.method();
  c.iMethod();
}
