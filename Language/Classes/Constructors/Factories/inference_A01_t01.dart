// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// `factory M` or the form `factory M.id` is `M` if `M` is not a generic type;
/// otherwise the return type `M<T1,..., Tn>` where `T1,...,Tn` are the type
/// parameters of the enclosing class.
///
/// @description Checks that the redirectee type of the factory constructor can
/// be inferred.
/// @author sgrekhov22@gmail.com

import 'inference_lib.dart';

void main() {
  const c1 = C0<String>.ok('data');
  print(c1);

  const c2 = C0.ok('data');
  print(c2);
}
