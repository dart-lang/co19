/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning to export two different libraries with the
 * same name unless their name is the empty string.
 * @description Checks it is no static warning if there are two export
 * directives referring to different uris with the same empty library name.
 * @static-clean
 * @author ilya
 */

export "same_name_t02_lib1.dart"; //anonymous library
export "same_name_t02_lib2.dart"; //anonymous library

main() {
}

