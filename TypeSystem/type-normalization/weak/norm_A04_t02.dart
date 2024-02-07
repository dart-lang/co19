// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// NORM(T*) =
///  let S be NORM(T)
///  if S is a top type then S
///  if S is Null then Null
///  if S is R? then R?
///  if S is R* then R*
///  else S*
///
/// @description Checks that if NORM(T) is Null then NORM(T*) = Null
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak

import 'opted_in_lib.dart';
import 'opted_out_lib.dart';

class C extends LF<Null> implements A<Null> {}

main() {
  new C();
}
