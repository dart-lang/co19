/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a list literal of the form
 * const <E>[e1... en] or the form <E>[e1... en] is List<E>.
 * @description Checks that the static type of a list literal is List<E> by
 * ensuring there're no static warnings when assigning such list to an
 * appropriately typed variable.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  const C();
}

main() {
  List<int> lInt = <int>[];
  lInt = const <int>[1, 2];

  List<num> lNum = <int>[];
  lNum = const <int>[1, 2];

  List<bool> lBool = <bool>[true];
  lBool = const <bool>[false, 1 < 1];

  List<C> lC = <C>[new C()];
  lC = const <C>[const C()];

  List<String> lString = <String> ["a", "b", "c"];
  lString = const <String>["A", "B", "C"];
}
