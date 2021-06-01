// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In general, a non-generic type alias is just expanded to its
/// aliased type, then the tear-off happens on that type. Tearing off
/// [IntList.filled] will act like tearing off [List<int>.filled], it
/// automatically instantiates the class type parameter to the specified type.
///
/// @description Checks that tearing-off automatically instantiates the class
/// type parameter to the specified type for non-generic type alias. Test
/// [List<num?>].
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

typedef MyList = List<num?>;

main() {
  var v = MytList.filled;
  List list1 = v(3, 1);
  Expect.equals([1, 1, 1], list1);

  List list2 = v(1, 1.3);
  Expect.equals([1.3], list2);

  List list3 = v(4, null);
  Expect.equals([null, null, null, null], list3);
}
