/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The form $id is equivalent to the form ${id}.
 * @description Checks that the result of using either form of string
 * interpolation construct is the same for both $id and ${id}, when id is a
 * function name.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

void id() {}

main() {
  Expect.stringEquals('${id}', '$id');
}
