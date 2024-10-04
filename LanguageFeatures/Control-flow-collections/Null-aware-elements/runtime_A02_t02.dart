// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If element is a `nullAwareMapElement` with entry `k: v`:
/// - Evaluate `k` to a value `kv`.
/// - If `element` has a null-aware key and `kv` is `null`, then stop. Else
///   continue...
/// - Evaluate `v` to a value `vv`.
/// - If `element` has a null-aware value and `vv` is `null`, then stop. Else
///   continue...
/// - Append an entry `kv: vv` to result.
///
/// @description Check that if `element` has a null-aware value and `vv` is
/// `null` then evaluation is stopped.
/// @author sgrekhov22@gmail.com
/// @issue 56848

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/expect.dart';

String _log = "";

int? f(int? v) {
  _log += "f($v);";
  return v;
}

main() {
  var map1 = {
    f(1): ?f(2),
    ?f(3): ?f(null),
    ?f(4): ?null
  };
  Expect.mapEquals({1: 2}, map1);
  Expect.equals("f(1);f(2);f(3);f(null);f(4);", _log);
  _log = "";

  var map2 = {
    ... {
      f(1): ?f(2),
      ?f(3): ?f(null),
      ?f(4): ?null
    },
    ?f(5): ?f(6)
  };
  Expect.mapEquals({1: 2, 5: 6}, map2);
  Expect.equals("f(1);f(2);f(3);f(null);f(4);f(5);f(6);", _log);
  _log = "";

  var map3 = {
    if (2 > 1) f(1): ?f(2),
    if (2 > 1) f(3): ?f(null),
    if (2 > 1) f(4): ?null
  };
  Expect.mapEquals({1: 2}, map3);
  Expect.equals("f(1);f(2);f(3);f(null);f(4);", _log);
  _log = "";

  var map4 = {
    for (var i = 0; i < 3; i++)
      if (i.isEven)
        f(i) : ?f(i + 1)
      else
        f(i + 10): ?f(null)
  };
  Expect.mapEquals({0: 1, 2: 3}, map4);
  Expect.equals("f(0);f(1);f(11);f(null);f(2);f(3);", _log);
  _log = "";

  var map5 = {
    for (var i in [0, 1, 2])
      if (i.isEven)
        f(i) : ?f(i + 1)
      else
        f(i + 10): ?f(null)
  };
  Expect.mapEquals({0: 1, 2: 3}, map5);
  Expect.equals("f(0);f(1);f(11);f(null);f(2);f(3);", _log);
}
