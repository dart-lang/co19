/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type T is more specific than a type S, written T << S, if T is ⊥.
 * << is a partial order on types. T is a subtype of S, written T <: S, iff [⊥/Dynamic]T << S.
 * A type T may be assigned to a type S, written T <=> S, if either T <: S or S <: T.
 * @description Checks that dynamic is subtype of any type (dynamic <: S, because Null << S)
 * @note Checking indirectly cause there is no object has runtime type dynamic. Check that
 * List<dynamic> is subtype of List<any type>.
 * @author ilya
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue([1, null, 'string'] is List<double>);
  Expect.isTrue([1, null, 'string'] is List<String>);
  Expect.isTrue([1, null, 'string'] is List<List>);
}
