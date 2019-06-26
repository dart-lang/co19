 /*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 34560 (Analyzer: Some correct
 * super-bounded types are rejected): check example from the bug description.
 * @author iarkh@unipro.ru
 */

class A<X extends num> {}

A<dynamic> a;
List<A<dynamic>> lst;

main() {
 A<dynamic>(); //# 01: compile-time error
}
