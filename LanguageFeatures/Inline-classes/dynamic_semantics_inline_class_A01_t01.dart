// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At run time, for a given instance o typed as an inline type V,
/// there is no reification of V associated with o.
///
/// @description Check that at a run-time type an instance of an inline class is
/// its representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V {
  final int id;
  V(this.id);
}

main() {
  var v = V(42);
  Expect.equals(int, v.runtimeType);
}
