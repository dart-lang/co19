/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library with a top level function main().
 * scriptDefinition:
 * scriptTag? libraryName? import* include* resource* topLevelDefinition*
 * ;
 * @description Checks that is is a compile-time error when a top-level
 * definition (a function declaration) comes before a resource directive.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#! scripts tag

#import('3_Library1.dart');

func(p) => p + 1;
#resource('favicon.ico');

main() {
  try {
    func(1);
  } catch(var e) {}
}
