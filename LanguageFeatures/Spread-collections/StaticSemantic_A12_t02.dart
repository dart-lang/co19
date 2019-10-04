/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion n/a
 * @description: Checks that spread elements in the list cannot have recurrent
 * references.
 * @compile-error
 * @author iarkh@unipro.ru
 */

main() {
  List l1 = [...l2];
  List l2 = [...l1];
}
