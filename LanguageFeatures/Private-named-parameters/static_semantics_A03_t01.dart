// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a named initializing formal or field parameter (for a
/// primary constructor) with private name `p` in constructor `C`:
/// ...
/// If there is no error then:
/// - The parameter name of the parameter in the constructor is the public name
///   `n`. This means that the parameter has a public name in the constructor's
///   function signature, and arguments for this parameter are given using the
///   public name. All uses of the constructor, outside of its own code, see
///   only the public name.
///
/// @description Check that the name of the parameter in the constructor
/// signature is a corresponding public name `n`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=private-named-parameters

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

class C {
  String? _p;

  C({this._p});
  C.named({required this._p});
}

extension type ET._(String? _p) {
  ET({this._p});
  ET.named({required this._p});
}

enum E {
  e0(p: "0"), e1.named(p: "1");

  final String? _p;

  const E({this._p});
  const E.named({required this._p});
}

main() {
  C.new.expectStaticType<Exactly<C Function({String? p})>>();
  C.named.expectStaticType<Exactly<C Function({required String? p})>>();
  ET.new.expectStaticType<Exactly<ET Function({String? p})>>();
  ET.named.expectStaticType<Exactly<ET Function({required String? p})>>();
  Expect.equals("0", E.e0._p);
  Expect.equals("1", E.e1._p);
}
