// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the name of m is a name in the interface of Object (that is,
/// toString, ==, etc.), the static analysis of the invocation is treated as an
/// ordinary instance member invocation on a receiver of type Object and with
/// the same args, if any.
///
/// @description Checks that members of an `Object` class can be called
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC {
  final int id;
  IC(this.id);
}

main() {
  IC ic = IC(42);
  ic.toString();
  ic.runtimeType;
  ic.hashCode;
  ic == ic;
}
