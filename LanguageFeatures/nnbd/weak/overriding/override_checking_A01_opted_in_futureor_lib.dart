// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Classes of this library are separated from 'override_checking_legacy lib' to
/// avoid all the override_checking_A02_* tests failing because of the bug
/// #39666.
///
/// @author iarkh@unipro.ru

// TODO(https://github.com/dart-lang/sdk/issues/51557): Decide if the mixins
// being applied in this test should be "mixin", "mixin class" or the test
// should be left at 2.19.
// @dart=2.19

library override_opted_in_lib;

import "dart:async";

class OPTED_FUTUREOR         <T extends FutureOr          > {}
class OPTED_FUTUREOR_INT     <T extends FutureOr<int>     > {}
class OPTED_FUTUREOR_FUTUREOR<T extends FutureOr<FutureOr>> {}
