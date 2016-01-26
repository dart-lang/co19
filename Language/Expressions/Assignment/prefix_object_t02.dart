/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * Let d be the innermost declaration whose name is v or v =, if it exists. It
 * is a compile-time error if d denotes a prefix object.
 * @description Checks the it is a compile-time error if d denotes a deferred
 * prefix object
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';
import "assignment_lib.dart" deferred as v;

main() {
  v = 1;
}
