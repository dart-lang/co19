/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Exactly the same static warnings that would be caused by C.v = e
 * are also generated in the case of C.v ??= e.
 * @description Checks that if C.v = e causes warning then C.v ??= e produces
 * the same warning as well
 * @static-warning
 * @author sgrekhov@unipro.ru
 */
class C {
  static List<int> v = null;
}

main() {
  List l = new List();
  C.v ??= l;  /// static type warning
}
