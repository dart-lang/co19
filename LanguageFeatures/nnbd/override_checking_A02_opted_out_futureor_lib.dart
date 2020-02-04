/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Classes of this library are separated from 'override_checking_legacy lib' to
 * avoid all the override_checking_A02_* tests failing because of the bug
 * #39666.
 *
 * @author iarkh@unipro.ru
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable

library override_legacy_futureor_lib;

import "dart:async";

class LEGACY_CLASS_FUTUREOR        <T extends FutureOr          > {}
class LEGACY_CLASS_FUTUREORFUTUREOR<T extends FutureOr<FutureOr>> {}

class LEGACY_CLASS_FUTUREORINT     <T extends FutureOr<int>     > {}
class LEGACY_CLASS_FUTUREORFUNCTION<T extends FutureOr<Function>> {}
