/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a map literal of the form
 * const <K, V>{k1: e1...kn: en} or the form <K, V>{k1: e1...kn: en} is
 * Map<K, V>.
 * @description Checks that the static type of a map literal is Map<String, V>
 * by ensuring there're no static warnings when assigning such map to a
 * variable of appropriate type.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  const C();
}

main() {
  Map<String, int> mInt = <String, int>{};
  mInt = const <String, int>{"k1": 1, "k2": 2};

  Map<String, bool> mBool = <String, bool> {"k1": true};
  mBool = const <String, bool> {"k1": false};

  Map<String, C> mC = <String, C> {"k1": new C()};
  mC = const <String, C> {"k2": const C()};

  Map<String, String> mString = <String, String> {"a" : "A", "b": "B"};
  mString = const <String, String> {"A": "a", "B": "b"};
}
