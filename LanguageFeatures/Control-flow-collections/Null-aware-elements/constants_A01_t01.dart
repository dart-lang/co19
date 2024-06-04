// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A `nullAwareExpressionElement` or `nullAwareMapElement` is
/// constant if its inner expression or map entry is constant.
///
/// @description Check that a `nullAwareExpressionElement` or
/// `nullAwareMapElement` is constant if its inner expression or map entry is
/// constant.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  const e1 = 2 > 1 ? 1 : null;
  const e2 = 1 > 2 ? 2 : null;
  const Nil = null;

  const set = {
    ?e1,
    ?e2,
    ?null,
    ?Nil
  };
  Expect.setEquals({e1}, set);

  const list = [
    ?e1,
    ?e2,
    ?null,
    ?Nil
  ];
  Expect.listEquals([e1], list);

  const map = {
    ?e1: 1,
    e1: ?null,
    e1: ?Nil,
    ?e1: ?e2,
    ?null: e2,
    ?Nil: e2,
  };
  Expect.mapEquals({e1: 1}, map);
}
