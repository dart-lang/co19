/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a map literal of the form  const <V>{k1:e1... kn :en}
 * or the form <V>{k1:e1... kn :en} is Map<String, V>.
 * @description Checks that the static type of a map literal is Map<String, V> by ensuring
 * there're no static warnings when assigning such map to a variable of appropriate type.
 * @author msyabro
 * @reviewer rodionov
 */

class C {
  const C();
}

main() {
  Map<String, int> mInt = <int>{};
  mInt = const <int>{"k1": 1, "k2": 2};

  Map<String, bool> mBool = <bool> {"k1": true};
  mBool = const <bool> {"k1": false};

  Map<String, C> mC = <C> {"k1": new C()};
  mC = const <C> {"k2": const C()};

  Map<String, String> mString = <String> {"a" : "A", "b": "B"};
  mString = const <String> {"A": "a", "B": "b"};
}
