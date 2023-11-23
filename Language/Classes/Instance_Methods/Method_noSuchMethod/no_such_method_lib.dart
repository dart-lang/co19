// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Helper library for `noSuchMethod` test
/// @author sgrekhov22@gmail.com

library no_such_method_lib;

abstract mixin class D0 {
  String _m();

  String test() => _m();
  dynamic noSuchMethod(Invocation i) => "D0";
}

mixin class D1 {
  String _m() => "S1";
  dynamic noSuchMethod(Invocation i) => "D1";
}

mixin class D2 {
  String _m() => "S2";
}
