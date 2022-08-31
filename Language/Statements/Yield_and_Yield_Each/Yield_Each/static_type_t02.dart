// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Let T be the static type of e and let f be the immediately
/// enclosing function. It is a static type warning if T may not be assigned
/// to the declared return type of f. If f is synchronous it is a static type
/// warning if T may not be assigned to Iterable. If f is asynchronous it is
/// a static type warning if T may not be assigned to Stream.
///
/// @description Check that compile error is issued, if the body of f is marked
/// async* and the type T may not be assigned to the declared return
/// type of f.
///
/// @issue #25634
/// @author a.semenov@unipro.ru

import 'dart:async';

Stream<String> generator() async* {
  yield* 1;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  generator();
}
