/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let MA be a mixin derived from a class M with direct superclass
 * Sstatic. Let A be an application of MA. It is a static warning if the
 * superclass of A is not a subtype of Sstatic.
 * @description Checks that it is a compile error to derive a mixin from a
 * class which has a superclass other than Object, even if a superclass of A is
 * subtype of Sstatic
 * @issue 26409
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class Sstatic {
}

class M extends Sstatic {
}

class SuperA extends Sstatic {
}

class A = SuperA with M;

main() {
  new A();
}
