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
 * @description Checks that a script is parsed without errors
 * if all allowed directives are present and in the correct order.
 * @author vasya
 * @reviewer rodionov
 * @reviewer msyabro
 * @note Issue 732
 */

#! scripts tag

#library("Library_with_all_directives");

#import('3_Library1.dart');
#import('3_Library2.dart');

#source('source.dart');
#source('source3.dart');

#resource("favicon.ico"); //VM reports error - issue 732

main() {
}
