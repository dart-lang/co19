// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is not an error if an extension type declares
/// static members with the basename `n` and there is a superinterface with
/// static members with the sane basename `n`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

extension type V1(int _) {
  static String get n => "V1";
}

extension type V2(int _) {
  static void set n(String n) {
    _log = "V2.n=$n";
  }
}

extension type V3(int _) {
  static String n() => "V3";
}

extension type ET1(int _) implements V1, V2, V3 {
  static void set n(String v) {
    _log = "ET1.n=$v";
  }
}

extension type ET2(int _) implements V1, V2, V3 {
  static String get n => "ET2";
}

extension type ET3(int _) implements V1, V2, V3 {
  static String n() => "ET3";
}

main() {
  Expect.equals("V1", V1.n);
  V2.n = "a";
  Expect.equals("V2.n=a", _log);
  Expect.equals("V3", V3.n());

  ET1.n = "b";
  Expect.equals("ET1.n=b", _log);
  Expect.equals("ET2", ET2.n);
  Expect.equals("ET3", ET3.n());
}
