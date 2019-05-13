/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a class definition of the form class C = M; or the
 * form class C<T1,...,Tn> = M; in library L is to introduce the name C into
 * the scope of L, bound to the class defined by the mixin application M.
 * The name of the class is also set to C. Iff the class is prefixed by the
 * built-in identifier abstract, the class being defined is an abstract class.
 * @description Checks that class C is not abstract (can be instantiated by
 * new) if there are no abstract identifier but all classes in mixin
 * application are abstract. Test type aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
abstract class M {
}

abstract class S {
}

typedef SAlias = S;
typedef MAlias = M;

class C = SAlias with MAlias;

main() {
  new C();
}
