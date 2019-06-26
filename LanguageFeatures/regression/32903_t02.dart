 /*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 32903 (Dartanalyzer 2.0
 * incorrectly throws [type_argument_not_matching_bounds] error for
 * super-bounded types in preview-dart-2 mode): check case with non-function
 * type alias.
 * @author iarkh@unipro.ru
 */
 // SharedOptions=--enable-experiment=nonfunction-type-aliases

class C<X extends C<X>> {}
class D extends C<D> {}

typedef A<X> = C<X>;

main() {
 A<dynamic> c = new D();
}