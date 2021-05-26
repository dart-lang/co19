// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion The static type of e is determined as follows:
/// • If d is a class, type alias or type parameter the static type of e is Type.
/// • If d is a local variable or formal parameter the static type of e is the
///   type of the variable id, unless id is known to have some type T, in which
///   case the static type of e is T, provided that T is more specic than any
///   other type S such that v is known to have type S.
/// • If d is a static method, top-level function or local function the static
///   type of e the function type defined by d.
/// • If d is the declaration of a static variable, static getter or static
///   setter declared in class C, the static type of e the static type of the
///   getter invocation C.id.
/// • If d is the declaration of a library variable, top-level getter or
///   top-level setter, the static type of e is the static type of the top level
///   getter invocation id.
/// • Otherwise, if e occurs inside a top level or static function (be it
///   function, method, getter, or setter) or variable initializer, the static
///   type of e is dynamic.
/// • Otherwise, the static type of e is the type of the property extraction
///   this.id.
/// @description Checks that if d is instance variable or getter declaraion,
/// the static type of e is the static type of the getter invocation this.id.
/// @author ilya


class C {
  int a;
  int get b => 1;
}

class D extends C {
  int c;
  int get d => 1;

  test() {
    int i;
    i = a;
    i = b;
    i = c;
    i = d;
  }
}

main() {
  new D().test();
}
