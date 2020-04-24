/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is NORM(Ti)
 *
 * @description Checks that NORM(C<T0, ..., Tn>) = C<R0, ..., Rn> where Ri is
 * NORM(Ti). Test T** == T*
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import 'opted_out_lib.dart';

class C extends LCG2<String> implements LCG<String> {}

main() {
  new C();
}
