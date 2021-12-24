// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const DartRepresentationOf(String nativeType)
///  Represents the Dart type corresponding to a NativeType.
///
/// @description Checks that DartRepresentationOf can be created
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

void main() {
  var o1 = new DartRepresentationOf("");
  Expect.isTrue(o1 is DartRepresentationOf);
  Expect.runtimeIsType<DartRepresentationOf>(o1);

  DartRepresentationOf o2 = new DartRepresentationOf("Double");
  Expect.isTrue(o2 is DartRepresentationOf);
  Expect.runtimeIsType<DartRepresentationOf>(o2);
  Expect.equals("DartRepresentationOf", o2.runtimeType.toString());
}
