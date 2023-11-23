// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The [Null] class extends the [Object] class and declares no
/// methods except those also declared by [Object].
/// @description Checks that invoking [toString] method on [null] does not yield
/// error.
/// @author hlodvig
/// @issue 42219


class A {}

main() {
  A? a = null;
  var x = a.toString();
}
