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
/// variable introduced by the parameter is the private name `p`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

import '../../Utils/expect.dart';

class C {
  String? _p1;
  String? p2;

  C({this._p1}) : p2 = _p1;
  C.named({required this._p1}) : p2 = _p1;
}

String log = "";

extension type ET._(String? _p) {
  ET({this._p}) : assert(() {log = _p; return true;}());
  ET.named({required this._p}) : assert(() {log = _p; return true;}());
}

enum E {
  e0(p: "0"), e1.named(p: "1");

  final String? _p1;
  final String? p2;

  const E({this._p1}) : p2 = _p1;
  const E.named({required this._p1}) : p2 = _p1;
}

main() {
  Expect.equals("one", C(p1: "one").p2);
  Expect.equals("two", C.named(p1: "two").p2);
  ET(p: "one");
  if (log.isNotEmpty) {
    Expect.equals("one", log);
    log = "";
  }
  ET.named(p: "two");
  if (log.isNotEmpty) {
    Expect.equals("two", log);
  }
  Expect.equals("0", E.e0.p2);
  Expect.equals("1", E.e1.p2);
}
