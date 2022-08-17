// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A built-in class [Record] with no members except those inherited
/// from [Object]. All record types are a subtype of this class. This type
/// cannot be constructed, extended, mixed in, or implemented by user-defined
/// classes.
///
/// @description Checks that all records have [Record] as a superclass
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

main() {
  var record1 = (42, "Lily was here");
  var record2 = (42, name: "Lily was here");
  var record3 = (name: "Lily was here", type: "Record");
  Expect.isTrue(record1 is Record);
  Expect.isTrue(record2 is Record);
  Expect.isTrue(record3 is Record);
}
