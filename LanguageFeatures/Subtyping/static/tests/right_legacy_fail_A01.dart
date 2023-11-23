// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Legacy T1 is S1* then:
/// - T0 <: T1 iff T0 <: S1?
/// @description Check that if type T1 is S1* and T0 is not subtype of S1? then
/// T0 is not subtype of T1.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

import "../../utils/legacy_lib.dart";

class S1 {
  const S1();
}
class T0 extends S1 {}

T0 t0Instance = new T0();
var t1Instance = getLegacyType<S1>(new S1());

const t1Default = const Y();

main() {
  t1Instance = t0Instance;
//             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
