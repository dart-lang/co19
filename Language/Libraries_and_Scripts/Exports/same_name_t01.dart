/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning to export two different libraries with the
 * same name unless their name is the empty string.
 * @description Checks it is a compile error if there are two export
 * directives referring to different uris with the same library name.
 * @compile-error
 * @author ilya
 */

export "same_name_t01_lib1.dart"; //library the_same_name;
export "same_name_t01_lib2.dart"; //library the_same_name;

main() {
}

