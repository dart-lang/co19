// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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

extension type BoolET1(bool _) {}
extension type BoolET2(bool _) implements bool {}
extension type const ConstBoolET1(bool _) {}
extension type const ConstBoolET2(bool _) implements bool {}

main() {
  dynamic _false = BoolET1(false);
  dynamic _true = BoolET2(true);
  const dynamic True = ConstBoolET1(true);
  const dynamic False = ConstBoolET2(false);

  Expect.isTrue(_true);
  Expect.isFalse(_false);
  Expect.isTrue(True);
  Expect.isFalse(False);
}
