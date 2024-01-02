// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let R0 be the extension type erasure of V0. At run time, the type
/// V0 has the same representation and semantics as R0. In particular, they
/// behave identically with respect to is, is!, as, and ==, both when V0 and R0
/// are used as types, and when they occur as subterms of another type.
///
/// @description Check that at run time, an extension type has the same
/// representation and semantics as its erasure
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

extension type IterableET1<T>(Iterable<T> id) {}
extension type IterableET2<T>(Iterable<T> id) implements Iterable<T> {}
extension type const ConstIterableET1<T>(Iterable<T> _) {}
extension type const ConstIterableET2<T>(Iterable<T> _)
    implements Iterable<T> {}

void main() {
  dynamic l1 = IterableET1(<int>[]);
  dynamic l2 = IterableET2(<int>[]);
  const dynamic cl1 = ConstIterableET1(<int>[]);
  const dynamic cl2 = ConstIterableET2(<int>[]);

  Expect.identical(l1.id, l1);
  Expect.identical(l2.id, l2);
  Expect.identical(cl1.id, cl1);
  Expect.identical(cl2.id, cl2);
}
