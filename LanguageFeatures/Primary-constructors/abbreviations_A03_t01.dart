// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that multiple constructors can be declared using keywords
/// `new` and `factory`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C {
  new();
  new _();
  new name() : this._();
  factory __() => C();
  factory other() = C.new;
}

mixin class M {
  new();
  new _();
  new name();
  factory __() => M();
  factory other() = M.new;
}

enum E {
  e0, e1._(), e2.name();

  const new();
  new _();
  new name() : this._();
  factory __() => E.e0;
  factory other() => E.e0;
}

main() {
  C();
  C._();
  C.name();
  C.__();
  C.other();
  M();
  M._();
  M.name();
  M.__();
  M.other();
  E.__();
  E.other();
}
