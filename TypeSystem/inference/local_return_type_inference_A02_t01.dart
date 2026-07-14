// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With null safety, local function body inference is changed so
/// that the local function name is not considered available for inference while
/// performing inference on the body. As a result, any recursive calls to the
/// function for which the result type is required for inference to complete
/// will no longer be treated as having return type `dynamic`, but will instead
/// result in an inference failure.
///
/// @description Checks that the return type of the local function is inferred.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

main() {
  foo() {
    if (1 > 2) {
      return 42;
    }
    return 3.14;
  }
  foo.expectStaticType<Exactly<num Function()>>();

  bar() {
    if (1 > 2) {
      return 42;
    }
    return null;
  }
  bar.expectStaticType<Exactly<int? Function()>>();

  baz() {
    if (1 > 2) {
      return 42;
    }
    return '';
  }
  baz.expectStaticType<Exactly<Object Function()>>();

  qux() {
    if (1 > 2) {
      return throw 42;
    }
    return '';
  }
  qux.expectStaticType<Exactly<String Function()>>();
}
