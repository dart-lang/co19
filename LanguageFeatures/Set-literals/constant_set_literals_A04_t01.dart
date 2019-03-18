/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a constant set literals is created which has the same type
 * argument and contains the same values in the same order, as the value of a
 * previously evaluated constant set literal, then the constant set literal
 * expression instead evaluates to the previously created constant set. That is,
 * constant set literals are canonicalized.
 *
 * @description Check that if a constant set literals is created which has the
 * same type argument and contains the same values in the same order, as the
 * value of a previously evaluated constant set literal, then the constant set
 * literal expression instead evaluates to the previously created constant set
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(identical(const <int>{}, const <int>{}));
  Expect.isFalse(identical(<int>{}, <int>{}));
  Expect.isFalse(identical(const <int>{}, <int>{}));

  Expect.isTrue(identical(const <int>{1, 2, 3}, const <int>{1, 2, 3}));
  Expect.isTrue(identical(const <int>{1, 2, 3}, const <int>{1, 2, 2 + 1,}));
  Expect.isTrue(identical(const <int>{1, 2, 3}, const <int>{1, 2, 3, }));
  Expect.isFalse(identical(const <int>{1, 2, 3}, const <int>{2, 3, 1}));

  const s1 = {'1', '2' + '1', "3 - 1", null, !true};
  var s2 = const {'1', '21', "3 - 1", null, false};
  Expect.isTrue(identical(s1, s2));
}
