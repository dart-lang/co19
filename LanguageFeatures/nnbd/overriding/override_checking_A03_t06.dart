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
 * @description Check that generic legacy class can inherit two opted in classes
 * with type parameters with contradictory nullability information.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak

import "override_checking_A03_opted_out_lib.dart";

main() {
 LEGACY_INT_1();
 LEGACY_INT_2();
 LEGACY_INT_1<int?>();
 LEGACY_INT_1<int>();
 LEGACY_INT_2<int?>();
 LEGACY_INT_2<int>();
 LEGACY_INT_1<Null>();
 LEGACY_INT_2<Null>();

 LEGACY_OBJECT_1();
 LEGACY_OBJECT_2();
 LEGACY_OBJECT_1<Object?>();
 LEGACY_OBJECT_1<Object>();
 LEGACY_OBJECT_2<Object?>();
 LEGACY_OBJECT_2<Object>();
 LEGACY_OBJECT_1<Null>();
 LEGACY_OBJECT_2<Null>();

 LEGACY_FUNCTION_1();
 LEGACY_FUNCTION_2();
 LEGACY_FUNCTION_1<Function?>();
 LEGACY_FUNCTION_1<Function>();
 LEGACY_FUNCTION_2<Function?>();
 LEGACY_FUNCTION_2<Function>();
 LEGACY_FUNCTION_1<Null>();
 LEGACY_FUNCTION_2<Null>();
}
