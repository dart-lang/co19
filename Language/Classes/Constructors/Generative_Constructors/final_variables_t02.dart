/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let k be a generative constructor.
 * Each final instance variable f declared in the immediately enclosing class
 * must have an initializer in k's initializer list unless it has already been
 * initialized by one of the following means:
 *  - Initialization at the declaration of f.
 *  - Initialization by means of an initializing formal of k.
 * or a static warning occurs.
 * @description Checks that no static warning occurs when all final variables
 * are initialized either at the declaration, via constructor's initializing
 * formal, or via an intializer in constructor's intializer list.
 * @static-clean
 * @author vasya
 */

class C {
  C(this.val2) : val3 = null {}
  final val1 = null;
  final val2;
  final val3;
}

main() {
  try {
    C c = new C("Initialization by means of an initializing formal of k");
  } catch (x) {}
}
