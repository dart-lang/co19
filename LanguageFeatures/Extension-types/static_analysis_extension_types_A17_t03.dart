// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that if an extension type doesn't implement subtype of
/// `Object` then it is a proper subtype of `Object?` (can be assigned to
/// `Object?`).
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(Object? id) {}

extension type V2<T>(T id) {}

extension type V3(Object id) {}

extension type V4<T extends Object>(T id) {}

main() {
  Object? o1 = V1(42);
  Object? o21 = V2<String?>(null);
  Object? o22 = V2<String>("42");
  Object? o3 = V3(42);
  Object? o4 = V4<String>("42");
}
