/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the static type of e in the expression 'throw e'
 * is not assignable to Object
 *
 * @description Check that it is an error if the static type of e in the
 * expression throw e is not assignable to Object. Test that it is not an error
 * to declare variable of type Never
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C {
  static late Never n1;
  late Never n2;
}

main() {
  Never n;
  try {
    n = throw new Exception();
  } catch (_) {
  }
}