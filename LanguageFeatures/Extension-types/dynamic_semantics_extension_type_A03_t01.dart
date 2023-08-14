// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type test, `o is U` or `o is! U`, and a type cast, `o as U`,
/// where `U` is or contains an extension type, is performed at run time as a
/// type test and type cast on the run-time representation of the extension type
///
/// @description Check that at run time a type test, `o is U` or `o is! U` is
/// performed as a type test on the run-time representation of the extension
/// type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

extension type V1(int id) {}

extension type V2<T>(T id) {}

void main() {
  var objects = [
    true,
    1,
    3.14,
    "String",
    #foo,
    <String>[],
    {'a': () {}},
    {42,},
    (),
    (42,),
    StringBuffer('Hello')
  ];

  for (var o in objects) {
    Expect.equals(o is V1, o is int);
    Expect.equals(o is! V1, o is! int);
    Expect.equals(o is V2<String>, o is String);
    Expect.equals(o is! V2<String>, o is! String);
  }
}
