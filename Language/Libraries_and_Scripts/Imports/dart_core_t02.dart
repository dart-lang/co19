/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The dart core library dart:core is implicitly imported into
 * every dart library other than itself via an import clause of the form
 * import `dart:core';
 * unless the importing library explicitly imports dart:core.
 * Any import of dart:core, even if restricted via show, hide or as, preempts
 * the automatic import.
 * @description Checks that explicit import of dart:core preempt automatic
 * import.
 * @compile-error
 * @author ilya
 */
import 'dart:core' show List;

main() {
  String; // String is not imported
}
