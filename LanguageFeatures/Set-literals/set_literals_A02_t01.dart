// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If s has no typeArgument, then one is inferred in exactly the same
/// way as for list literals. (Either infer it from the context type, or if there
/// is no context type, or the context type does not constrain the element type,
/// then do upwards inference based on the static type of the element
/// expressions, if any, or otherwise fall back on dynamic).
///
/// @description Checks that if s has no typeArgument, then one is inferred in
/// exactly the same way as for list literals
/// @author sgrekhov@unipro.ru
/// @issue 43281

import "../../Utils/expect.dart";

main() {
  var v1 = const {1, 2, 3};
  Expect.isTrue(v1 is Set<int>);
  checkType(checkIs<Set<int>>, true, v1);

  const v2 = {1, 2, 3};
  Expect.isTrue(v2 is Set<int>);
  checkType(checkIs<Set<int>>, true, v2);

  var v3 = {1, 2, 3};
  Expect.isTrue(v3 is Set<int>);
  checkType(checkIs<Set<int>>, true, v3);

  var v4 = const {'1', '2', '3'};
  Expect.isTrue(v4 is Set<String>);
  checkType(checkIs<Set<String>>, true, v4);

  const v5 = {'1', '2', '3'};
  Expect.isTrue(v5 is Set<String>);
  checkType(checkIs<Set<String>>, true, v5);

  var v6 = {'1', '2', '3'};
  Expect.isTrue(v6 is Set<String>);
  checkType(checkIs<Set<String>>, true, v6);

  var v7 = const {'1', 2, '3', null};
  Expect.isTrue(v7 is Set<Object?>);
  checkType(checkIs<Set<Object?>>, true, v7);

  const v8 = {'1', 2, '3', null};
  Expect.isTrue(v8 is Set<Object?>);
  checkType(checkIs<Set<Object?>>, true, v8);

  var v9 = {'1', 2, '3', null};
  Expect.isTrue(v9 is Set<Object?>);
  checkType(checkIs<Set<Object?>>, true, v9);

  dynamic d;

  var v10 = {'1', 2, '3', null, d};
  Expect.isTrue(v10 is Set<dynamic>);
  checkType(checkIs<Set<dynamic>>, true, v10);

  var v11  = {1, 2, 3.14};
  Expect.isTrue(v11 is Set<num>);
  checkType(checkIs<Set<num>>, true, v11);

  var v12  = {1, 1.0};
  Expect.isTrue(v12 is Set<num>);
  checkType(checkIs<Set<num>>, true, v12);
}
