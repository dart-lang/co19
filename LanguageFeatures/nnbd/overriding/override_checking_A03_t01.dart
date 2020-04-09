/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Members inherited in a class in an opted-in library, which are
 * inherited via a class or mixin defined in a legacy library are viewed with
 * their erased legacy signature, even if they were original defined in an
 * opted-in library. Note that if a class which is defined in a legacy library
 * inherits a member with the same name from multiple super-interfaces, then
 * error checking is done as usual using the legacy typing rules which ignore
 * nullability. This means that it is valid for a legacy class to inherit the
 * same member signature with contradictory nullability information. For the
 * purposes of member lookup within a legacy library, nullability information is
 * ignored, and so it is valid to simply erase the nullability information
 * within the legacy library. When referenced from an opted-in library, the same
 * erasure is performed, and the member is seen at its legacy type.
 *
 * We use legacy subtyping when checking inherited member signature coherence in
 * classes because opted out libraries may bring together otherwise incompatible
 * member signatures without causing an error.
 *
 * @description Check that legacy class can inherit the same method with
 * parameter from two opted in classes with contradictory nullability
 * information.
 *
 * @Issue 40978
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "override_checking_A03_opted_out_lib.dart";

main() {
  LEGACY_ARGS_1 x1 = LEGACY_ARGS_1();
  x1.test_int     (null);
  x1.test_object  (null);
  x1.test_function(null);

  LEGACY_ARGS_2 x2 = LEGACY_ARGS_2();
  x2.test_int     (null);
  x2.test_object  (null);
  x2.test_function(null);
}
