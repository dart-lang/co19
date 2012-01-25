/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of all of
 * the type parameters of G. The type parameters of a generic class or interface
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the non-static members of G.
 * @description Checks that example of F-bounded quantification is parsed correctly.
 * @static-warning
 * @author iefremov
 * @needsreview issue 964
 */


class Enum<E extends Enum<E>> {}
class Things extends Enum<Things> {}
class SubThings extends Things {}

main() {
  var x = new Enum<SubThings>(); //intentional static warning
}