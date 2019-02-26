/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is no error to derive a mixin from a class which has a
 * superclass other than Object.
 * @description Checks that it is no error to derive a mixin from a class
 * which has a superclass other than Object.
 * @issue 26409
 * @issue 27531
 * @author sgrekhov@unipro.ru
 */

class Sstatic {
}

class M extends Sstatic {
}

class SuperA {
}

class A = SuperA with M;

main() {
  new A();
}
