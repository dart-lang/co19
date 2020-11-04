/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 * ...
 * If P is Set<Ps> then let S be the inferred type of e1 in context Iterable<Ps>:
 * ...
 * Otherwise it is an error
 *
 * @description Checks that otherwise it is an error
 * @author sgrekhov@unipro.ru
 */

main() {
  String? s = "Let it be";
  var x1 = <String >{...s};
//                      ^
// [analyzer] COMPILE_TIME_ERROR.NOT_ITERABLE_SPREAD
// [cfe] Unexpected type 'String' of a spread.  Expected 'dynamic' or an Iterable.
  var x2 = <String?>{...?s};
// [error line 25, column 0]
// [analyzer] unspecified
// [cfe] unspecified
}
