// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All name conflicts specified in the language specification
/// section 'Class Member Conflicts' occur as well in an extension type
/// declaration.
///
/// @description Checks that it is not an error if an extension type declares
/// static members with the basename `n` and there is a superinterface with
/// non-extension static members with the sane basename `n`.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

String _log = "";

class C1 {
  static String get n => "C1";
}

class C2 {
  static void set n(String n) {
    _log = "C2.n=$n";
  }
}

class C3 {
  static String n() => "C3";
}

class D implements C1, C2, C3 {}

extension type ET1(D _) implements C1, C2, C3 {
  static void set n(String v) {
    _log = "ET1.n=$v";
  }
}

extension type ET2(D _) implements C1, C2, C3 {
  static String get n => "ET2";
}

extension type ET3(D _) implements C1, C2, C3 {
  static String n() => "ET3";
}

main() {
  Expect.equals("C1", C1.n);
  C2.n = "a";
  Expect.equals("C2.n=a", _log);
  Expect.equals("C3", C3.n());

  ET1.n = "b";
  Expect.equals("ET1.n=b", _log);
  Expect.equals("ET2", ET2.n);
  Expect.equals("ET3", ET3.n());
}
