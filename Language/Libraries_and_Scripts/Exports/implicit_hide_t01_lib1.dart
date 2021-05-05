// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

library lib1;

import 'implicit_hide_t01_lib2.dart' show List;
export 'implicit_hide_t01_lib2.dart';

class List2 {
  static final typename = List.typename + '2';
}
