// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The ability to use `new` or `factory` as a keyword and omitting
/// the class name in declarations of ordinary (non-primary) constructors is
/// purely syntactic. The static analysis and meaning of such constructors is
/// identical to the form that uses the class name.
///
/// @description Check that `new` can be used instead of the class name in
/// declarations of ordinary constructors. Test extension types.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

const metadata = 42;

extension type ET1._(int v) {
  @metadata const new(this.v);
}

extension type ET2._(int v) {
  @metadata new() : v = 2;
}

extension type ET3._(int v) {
  const new([int v = 0]) : v = v;
}

extension type ET4._(int v) {
  new({int v = 0}) : v = v;
}

extension type ET5._(int v) {
  const new({required int v}) : v = v;
}

main() {
  Expect.equals(1, ET1(1).v);
  Expect.equals(2, ET2().v);
  Expect.equals(3, ET3(3).v);
  Expect.equals(0, ET3().v);
  Expect.equals(4, ET4(v: 4).v);
  Expect.equals(0, ET4().v);
  Expect.equals(5, ET5(v: 5).v);
  Expect.equals(0, ET5().v);
}
