// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference works for extension types as for regular types
///
/// @description Check that type inference works for extension types. Type can
/// be inferred from an extension type to its representation type and back. Test
/// an enumerated type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";
import "../../Utils/static_type_helper.dart";

extension type ListET1<T>(List<T> _) {}
extension type ListET2<T>(List<T> _) implements List<T> {}

main() {
  var l1 = ListET1([1, 2, 3]);
  l1.expectStaticType<Exactly<ListET1<int>>>();

  var l2 = ListET1(<num>[1, 2, 3]);
  l2.expectStaticType<Exactly<ListET1<num>>>();

  var l3 = ListET1<String>([]);
  l3.expectStaticType<Exactly<ListET1<String>>>();

  var [v1] = ListET2([1]);
  v1.expectStaticType<Exactly<int>>();

  var [v2] = ListET2(<num>[1]);
  v2.expectStaticType<Exactly<num>>();

  Expect.throws(() {
    var [v3] = ListET2<String>([]);
    v3.expectStaticType<Exactly<String>>();
  });
}
