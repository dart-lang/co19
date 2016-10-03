/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of the is-expression e is T proceeds as follows:
 * The expression e is evaluated to a value v.
 * Then, if T is malformed or deferred type, a dynamic error occurs.
 * Otherwise, if the interface of the class of v is a subtype of T, the
 * is-expression evaluates to true.
 * Otherwise it evaluates to false.
 * @description Checks that if T is deferred, then compile error occurs.
 * @compile-error
 * @author ngl@unipro.ru
 */
import '../lib.dart' deferred as lb;

main() {
  1 is lb.A;
}
