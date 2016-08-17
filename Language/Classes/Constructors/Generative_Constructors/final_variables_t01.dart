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
 * @description Checks that static warning is produced if a final variable is
 * not initialized in one of the specified ways.
 * @static-warning
 * @author vasya
 * @reviewer pagolubev
 * @reviewer iefremov
 */

class C {
  C() {}
  final _val;
}

main() {
  C c = new C();}
