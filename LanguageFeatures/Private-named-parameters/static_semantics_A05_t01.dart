// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// ...
/// - The instance variable initialized by the parameter (and declared by it, if
///   the parameter is a field parameter), has the private name `p`.
///
/// @description Check that the instance variable initialized by the
/// initializing formal parameter has the private name `p`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

import '../../Utils/expect.dart';

class C {
  String _p;

  C({this._p = "_p"});
  C.named({required this._p});
}

extension type ET._(String _p) {
  ET({this._p = "_p"});
  ET.named({required this._p});
}

enum E {
  e0, e1(p: "one"), e2.named(p: "1");

  final String _p;

  const E({this._p = "_p"});
  const E.named({required this._p});
}

main() {
  Expect.equals("_p", C()._p);
  Expect.equals("one", C(p: "one")._p);
  Expect.equals("1", C.named(p: "1")._p);

  Expect.equals("_p", ET()._p);
  Expect.equals("one", ET(p: "one")._p);
  Expect.equals("two", ET.named(p: "two")._p);

  Expect.equals("_p", E.e0._p);
  Expect.equals("one", E.e1._p);
  Expect.equals("1", E.e2._p);
}
