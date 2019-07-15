/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We do not allow implicit tear-off of an extension call method in a
 * function typed context.
 *
 * @description Check that implicit tear-off of an extension call method in a
 * function typed context is a compile-time error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension on int {
  String call(int v) => "Result: $v";
}

String Function(int) from1 = 1;     //# 01: compile-time error

main() {
  String Function(int) from2 = 2;   //# 02: compile-time error
}
