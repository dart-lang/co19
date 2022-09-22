// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a field name starts with an underscore, it is private and is
/// only accessible in the library where it appears. The records `(_foo: 1)` and
/// `(_foo: 1)` appearing in different libraries do not have the same shape
/// because each `_foo` is considered a distinct name. Likewise, the record
/// types `({int _foo})` and `({int _foo})` are not the same type if those
/// annotations appear in different libraries.
///
/// @description Checks that the record types `({int _foo})` and `({int _foo})`
/// are not the same type if those annotations appear in different libraries
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "static_semantics_A05_lib.dart" as l;
import "../../Utils/expect.dart";

typedef T1 (num _, {String _name});
typedef T2 (num, {String _name});

main() {
  Expect.notEquals(l.T1, T1);
  Expect.notEquals(l.T2, T2);
}
