// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with the
/// actual type arguments T1, ..., Ts. If the invocation includes an actual
/// argument part (possibly including some actual type arguments) then call it
/// args. If the invocation does not include an actual argument part, but it
/// does include a list of actual type arguments, call it typeArgs. Finally,
/// assume that V declares the type variables X1, ..., Xs.
///
/// Note that if the name of m is a name in the interface of Object (that is,
/// toString, ==, hashCode, runtimeType, or noSuchMethod), the denoted member is
/// necessarily a non-extension type member, which determines the static
/// analysis and dynamic semantics.
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
