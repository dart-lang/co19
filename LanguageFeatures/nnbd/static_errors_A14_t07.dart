/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For the purposes of errors and warnings, the null aware operators
 * ?., ?.., and ?[] are checked as if the receiver of the operator had
 * non-nullable type. More specifically, if the type of the receiver of a null
 * aware operator is T, then the operator is checked as if the receiver had type
 * NonNull(T).
 *
 * @description Check that if the type of the receiver of a null aware operator
 * is T, then the operator is checked as if the receiver had type NonNull(T).
 * Test some type A*, where A is non-nullable
 * @issue 38715
 * @author sgrekhov@unipro.ru
 * @static-warning
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

main() {
  A a = new A();
  a?.test();      /// static type warning
  a ?.. test();   /// static type warning
  a?[0];          /// static type warning
}
