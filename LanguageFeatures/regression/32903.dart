 /*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 32903 (Dartanalyzer 2.0
 * incorrectly throws [type_argument_not_matching_bounds] error for
 * super-bounded types in preview-dart-2 mode).
 * @author iarkh@unipro.ru
 */
import "dart:async";

class A<X extends Future<X>> {}

testme([A a]) {}

A<dynamic> a;

main() {
 testme(a);
}
