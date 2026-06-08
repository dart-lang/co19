// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In short, the class name and the period are replaced by the
/// keyword `new` (in a generative constructor) or simply removed (in a factory
/// constructor).
///
/// @description Check that multiple constructors can be declared using keywords
/// `new` and `factory`. Test primary constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C.primary() {
  new() : this.primary();
  new _() : this();
  new name() : this._();
  factory __() => C.primary();
  factory other() = C.primary;
}

mixin class M.primary() {
  factory () => M.primary();
  factory _() => M.primary();
  factory other() = M.primary;
}

enum E.primary() {
  e0, e1._(), e2.name();

  new() : this.primary();
  new _() : this();
  new name() : this._();
  factory __() => E.e0;
  factory other() => E.e0;
}

extension type ET.primary(int v) {
  new(this.v);
  new _(this.v);
  new name() : this._(0);
  factory __() => ET(0);
  factory other(int v) = ET.new;
}

main() {
  C();
  C._();
  C.name();
  C.__();
  C.other();
  M();
  M._();
  M.other();
  E.__();
  E.other();
  ET(1);
  ET._(2);
  ET.name();
  ET.__();
  ET.other(3);
}
