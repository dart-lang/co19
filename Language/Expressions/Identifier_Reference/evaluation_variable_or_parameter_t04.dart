/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • If d is a local variable or formal parameter then e evaluates to the
 *   current binding of id.
 * @description Checks that reference to a loop counter captured by a closure
 * results in unique binding.
 * @author ilya
 */
import '../../../Utils/expect.dart';

main() {
  var closures = [];
  for (var i = 0; i < 5; ++i) {
    closures.add(() => i);
  }

  Expect.listEquals([0, 1, 2, 3, 4], closures.map((x) => x()).toList());
}
