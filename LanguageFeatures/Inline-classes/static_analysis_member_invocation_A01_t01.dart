// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the name of m is a name in the interface of Object (that is,
/// toString, ==, hashCode, runtimeType, or noSuchMethod), the static analysis
/// of the invocation is treated as an ordinary instance member invocation on a
/// receiver of type Object? and with the same args or typeArgs, if any.
///
/// @description Checks that members of an `Object` class can be called
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type ET(int id) {}

main() {
  ET et = ET(42);
  et.toString();
  et.runtimeType;
  et.hashCode;
  et == et;
  try {
    et.noSuchMethod(Invocation.method(Symbol("test"), []));
  } catch (_) {}
}
