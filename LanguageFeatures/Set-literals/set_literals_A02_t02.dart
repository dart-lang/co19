/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s has no typeArgument, then one is inferred in exactly the same
 * way as for list literals. (Either infer it from the context type, or if there
 * is no context type, or the context type does not constrain the element type,
 * then do upwards inference based on the static type of the element
 * expressions, if any, or otherwise fall back on dynamic).
 *
 * @description Checks that if s has no typeArgument, then one is inferred in
 * exactly the same way as for list literals
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

test(Set<Object> s, String type) {
  Expect.equals(type, s.runtimeType.toString());
}

main() {
  var v1  = const {1, 2, 3};
  test(v1, "Set<int>");

  var v2  = const {'1', '2', '3'};
  test(v2, "Set<String>");

  var v3  = const {'1', 2, '3'};
  test(v3, "Set<Object>");

  var v4  = {1, 2, 3,};
  test(v4, "Set<int>");

  var v5  = {'1', '2', '3',};
  test(v5, "Set<String>");

  var v6  = {'1', 2, '3',};
  test(v6, "Set<Object>");

  var v7  = {1, 2, 3.14,};
  test(v7, "Set<num>");
}
