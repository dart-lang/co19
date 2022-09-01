// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion There is no syntax for a zero-field record expression. Instead,
/// there is a static constant empty on [Record] that returns the empty record.
///
/// @description Checks that there is a static constant empty on [Record] that
/// returns the empty record
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

Record foo() => Record.empty;

Record bar(Record r) => r;

main() {
  var record1 = Record.empty;
  Expect.equals(Record.empty, record1);
  Expect.equals(Record.empty, bar(Record.empty));

  var record2 = (Record.empty, n: Record.empty);
  Expect.equals(Record.empty, record2.$0);
  Expect.equals(Record.empty, record2.n);

  Expect.notEquals(Record.empty, (Record.empty,));
}
