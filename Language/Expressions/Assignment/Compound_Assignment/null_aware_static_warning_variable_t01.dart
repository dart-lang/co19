/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Exactly the same static warnings that would be caused by v = e
 * are also generated in the case of v ??= e.
 * @description Checks that if v = e causes warning then v ??= e produces the
 * same warning as well
 * @author sgrekhov@unipro.ru
 */
main() {
  double v = null;
  int e = 1;
  v ??= e;  /// 01: static type warning, dynamic type error
}
