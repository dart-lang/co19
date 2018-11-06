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
 * @description Checks that the 'on' word can be used as a name of mixin.
 * @author ngl@unipro.ru
 */

class I {}
class J {}

class B {}
class C {}

mixin on on B, C implements I, J {}

class A implements B, C, I, J {}

class MA extends A with on {
}

main() {
  new MA();
}
