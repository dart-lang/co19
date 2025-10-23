// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The local variable introduced by the parameter, accessible only in the
///   initializer list, still has the private name `p`.
///
/// @description Check that in the initializer list the name of the local
/// variable introduced by the parameter is the private name `p`. Test declaring
/// constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters,declaring-constructors

import '../../Utils/expect.dart';

class C1({var String? _p1}) {
  String? p2;
  this : p2 = _p1;
}

class C2 {
  String p2;
  this({required final String _p1}) : p2 = _p1;
}

String log = "";

extension type ET1 {
  this({final String? _p}) : assert(() {log = _p; return true;}());
}

extension type ET2 {
  this({required final String _p}) : assert(() {log = _p; return true;}());
}

enum E1({final String? _p1}) {
  e0(p1: "E1");

  final String? p2;
  this : p2 = _p1;
}

enum E2 {
  e0(p1: "E2");

  final String p2;
  const this({final String? _p1}) : p2 = _p1;
}

main() {
  Expect.equals("one", C1(p1: "one").p2);
  Expect.equals("two", C2(p1: "two").p2);
  ET1(p: "one");
  if (log.isNotEmpty) {
    Expect.equals("one", log);
    log = "";
  }
  ET2(p: "two");
  if (log.isNotEmpty) {
    Expect.equals("two", log);
  }
  Expect.equals("E1", E1.e0.p2);
  Expect.equals("E2", E2.e0.p2);
}
