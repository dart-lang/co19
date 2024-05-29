// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is not an error if an extension type declares an
/// instance member with the basename `n` and there is a superinterface with a
/// static setter with the name `n`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

extension type V1(int _) {
  static void set n(String v) {
    _log = "V1.n=$v";
  }
}

extension type ET1(V1 _) implements V1 {
  String n() => "ET1";
}

extension type ET2(V1 _) implements V1 {
  String get n => "ET2";
}

extension type ET3(V1 _) implements V1 {
  void set n(String v) {
    _log = "ET3.n=$v";
  }
}

main() {
  V1.n = "x";
  Expect.equals("V1.n=x", _log);
  Expect.equals("ET1", ET1(V1(1)).n());
  Expect.equals("ET2", ET2(V1(2)).n);
  ET3(V1(2)).n = "y";
  Expect.equals("ET3.n=y", _log);
}
