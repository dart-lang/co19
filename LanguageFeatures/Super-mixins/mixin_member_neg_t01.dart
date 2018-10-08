/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The mixinMember production allows the same instance or static
 * members that a class would allow, but no constructors (for now).
 *
 * @description Checks that mixin declaration doesn't allow constructors.
 * @author ngl@unipro.ru
 */

class I {}
class J {}

class B {}
class C {}

mixin M on B, C implements I, J {
  M() {}
}

class MA with M {}

main() {
  new MA();
}
