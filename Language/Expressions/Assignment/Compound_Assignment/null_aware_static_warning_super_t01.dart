/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Exactly the same static warnings that would be caused by
 * super.v = e are also generated in the case of super.v ??= e.
 * @description Checks that if super.v = e causes warning then super.v ??= e
 * produces the same warning as well
 * @author sgrekhov@unipro.ru
 */
class A {
  int v;
}

class C extends A {
  void test() {
    super.v ??= 3.14;  /// 01: static type warning, dynamic type error
  }
}

main() {
  new C().test();
}
