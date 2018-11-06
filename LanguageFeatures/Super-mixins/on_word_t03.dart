/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The on word is not reserved in any way, it is a context-specific
 * keyword that has a specific meaning when occuring after the type name of a
 * mixin declaration.
 *
 * @description Checks that the 'on' word can be used as a type name after 'on'
 * and after 'implements' in the mixin declaration.
 * @author ngl@unipro.ru
 */

class I {}
class J {}

class B {}
class C {
}

class on {}

mixin M1 on on, C implements I, J {}
mixin M2 on B, on implements I, J {}
mixin M3 on B, C implements on, J {}
mixin M4 on B, C implements I, on {}

class A implements B, C, I, J, on {}

class MA1 extends A with M1 {
}
class MA2 extends A with M2 {
}
class MA3 extends A with M3 {
}
class MA4 extends A with M4 {
}

main() {
  new MA1();
  new MA2();
  new MA3();
  new MA4();
}
