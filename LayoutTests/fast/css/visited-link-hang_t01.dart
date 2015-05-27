/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p>If this test runs without hanging, then it has passed. The visited link hash algorithm was N^2 at one point and would hang.</p>
      <p id="test1"></p>
      <p id="test2"></p>
      <p id="test3"></p>
      <p id="result">TEST DID NOT RUN YET</p>
      ''', treeSanitizer: new NullTreeSanitizer());
  var sb = new StringBuffer();
  var oneMillionSlashes;
  for (var i = 0; i < 1000000; ++i)
    sb.write("/");
  oneMillionSlashes = sb.toString();
  
  sb.clear();
  var oneMillionSlashesAndDots;
  for (var i = 0; i < 333334; ++i)
    sb.write("/./");
  oneMillionSlashesAndDots = sb.toString();

  sb.clear();
  var oneMillionSlashesAndDoubleDots;
  for (var i = 0; i < 250000; ++i)
    sb.write("/../");
  oneMillionSlashesAndDoubleDots = sb.toString();

  document.getElementById("test1").innerHtml = '<a href="about:test?slashes' + oneMillionSlashes + '">Link with tons of slashes</a>';
  document.getElementById("test2").innerHtml = '<a href="about:test?slashes' + oneMillionSlashesAndDots + '">Link with tons of slashes with dots</a>';
  document.getElementById("test3").innerHtml = '<a href="about:test?slashes' + oneMillionSlashesAndDoubleDots + '">Link with tons of slashes with double dots</a>';

  oneMillionSlashes = null;
  oneMillionSlashesAndDots = null;
  oneMillionSlashesAndDoubleDots = null;
  gc();

  (document.getElementById("result").firstChild as Text).data = "PASS";
}
