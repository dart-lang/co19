// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that if an instantiated representation type is
/// non-nullable and the extension type implements `Object` then it is a proper
/// subtype of `Object` (can be assigned to `Object`).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int id) implements Object {}

extension type V2<T extends num>(T id) implements Object {}

main() {
  Object v1 = V1(42);
  Object v2 = V2<int>(42);
}
