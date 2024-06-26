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

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

main() {
  const e1 = 2 > 1 ? 1 : null;
  const e2 = 1 > 2 ? 2 : null;
  const nil = null;

  const set = {
    ?e1,
    ?e2,
    ?null,
    ?nil
  };
  Expect.setEquals({e1}, set);

  const list = [
    ?e1,
    ?e2,
    ?null,
    ?nil
  ];
  Expect.listEquals([e1], list);

  const map = {
    ?e1: 1,
    e1: ?null,
    e1: ?nil,
    ?e1: ?e2,
    ?null: e2,
    ?nil: e2,
    1: ?e1
  };
  Expect.mapEquals({e1: 1, 1: e1}, map);
}
