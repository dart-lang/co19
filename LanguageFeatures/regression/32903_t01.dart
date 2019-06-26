 /*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the issue 32903 (Dartanalyzer 2.0
 * incorrectly throws [type_argument_not_matching_bounds] error for
 * super-bounded types in preview-dart-2 mode): chack test case from the bug
 * description.
 * @author iarkh@unipro.ru
 */

class C<X extends C<X>> {}
class D extends C<D> {}

main() {
 C<dynamic> c = new D();
}