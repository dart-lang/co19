// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an extension type declaration DV has a non-extension
/// type member named n in the case where DV does not declare a member named n,
/// and one of the following criteria is satisfied:
/// - DV has a direct extension type superinterface V that has a non-extension
///   type member with signature m and name n, and DV does not declare an
///   instance member that precludes m.
/// - DV has a direct non-extension type superinterface whose interface contains
///   a member signature m named n, and DV does not declare an instance member
///   that precludes m.
///
/// @description Checks that if an extension type `ET` has a superinterface with
/// a member `m` then this member is also present in `ET`
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

extension type ET(int id) implements num {}

main() {
  ET et = ET(42);
  Expect.equals(42, et.ceil());
}
