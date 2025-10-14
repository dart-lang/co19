// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` rather than the class name in
/// declarations of ordinary (non-declaring) constructors is purely syntactic.
/// The static analysis and meaning of such constructors is identical to the
/// form that uses the class name.
///
/// @description Check that `new` can be used instead of the class name in
/// declarations of ordinary constructors. Test extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

extension type ET1._(int v) {
  const new(this.v);
  new.someName(this.v);
}

extension type ET2._(int v) {
  new() : v = 2;
  const new.someName() : v = -2;
}

extension type ET3._(int v) {
  const new([int v = 0]) : v = v;
  new.someName([int v = 0]) : v = v;
}

extension type ET4._(int v) {
  new({int v = 0}) : v = v;
  const new.someName({int v = 0}) : v = v;
}

extension type ET5._(int v) {
  const new({required int v}) : v = v;
  new.someName({required int v}) : v = v;
}

extension type ET6._(int v) {
  new(int v) : v = v;
  const factory new.someName(int v) = ET6;
}

extension type ET7._(int v) {
  factory new(int v) => ET7.someName(v);
  new.someName(this.v);
}

main() {
  Expect.equals(1, ET1(1).v);
  Expect.equals(1, C1.someName(1).v);
  Expect.equals(2, ET2().v);
  Expect.equals(-2, ET2.someName().v);
  Expect.equals(3, ET3(3).v);
  Expect.equals(3, ET3.someName(3).v);
  Expect.equals(0, ET3().v);
  Expect.equals(0, ET3.someName().v);
  Expect.equals(4, ET4(v: 4).v);
  Expect.equals(4, ET4.someName(v: 4).v);
  Expect.equals(0, ET4().v);
  Expect.equals(0, ET4.someName().v);
  Expect.equals(5, ET5(v: 5).v);
  Expect.equals(5, ET5.someName(v: 5).v);
  Expect.equals(0, ET5().v);
  Expect.equals(0, ET5.someName().v);
  Expect.equals(6, ET6(6).v);
  Expect.equals(6, ET6.someName(6).v);
  Expect.equals(7, ET7(7).v);
  Expect.equals(7, ET7.someName(7).v);
}
