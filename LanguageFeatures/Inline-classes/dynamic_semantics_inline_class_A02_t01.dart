// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The run-time representation of a type argument which is an inline
/// type V is the corresponding instantiated representation type.
///
/// @description Check that at a run time an instance of an inline class is
/// treated as an instance of its representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V {
  final int id;
  V(this.id);
}

main() {
  var v = V(42);
  int i = v as int;
  Expect.equals(42, i);
  Expect.isTrue(i.isEven);
}
