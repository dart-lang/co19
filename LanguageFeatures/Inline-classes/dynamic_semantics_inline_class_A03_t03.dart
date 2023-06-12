// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type test, o is U or o is! U, and a type cast, o as U, where U
/// is or contains an inline type, is performed at run time as a type test and
/// type cast on the run-time representation of the inline type
///
/// @description Check that it is a run-time error to cast an inline type
/// `o as U` if `U` is not a supertype of its representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V1 {
  final double id;
  V1(this.id);
}

inline class V2 {
  final String id;
  V2(this.id);
}

main() {
  var v = V1(3.14);
  Expect.throws(() {v as int;});

  String s = "3.14";
  Expect.throws(() {s as V1;});
}
