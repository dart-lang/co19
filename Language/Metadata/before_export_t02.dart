// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Metadata can appear before  ...  export ...
/// @description Check that metadata is allowed before export directive
/// @author sgrekhov@unipro.ru

import 'before_export_lib3.dart';

main() {
  new B();
}
