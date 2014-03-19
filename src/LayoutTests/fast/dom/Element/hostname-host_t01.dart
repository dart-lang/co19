/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <a  href="http://dev.w3.org:80/html5/spec/infrastructure.html#interfaces-for-url-manipulation">http with default port</a><br>
    <a  href="https://dev.w3.org:443/html5/spec/infrastructure.html#interfaces-for-url-manipulation">https with default port</a><br>
    <a  href="ftp://dev.w3.org:21/html5/spec/infrastructure.html#interfaces-for-url-manipulation">ftp with default port</a><br>
    <br>
    <a  href="http://dev.w3.org:123/html5/spec/infrastructure.html#interfaces-for-url-manipulation">http with non-default port</a><br>
    <a  href="https://dev.w3.org:123/html5/spec/infrastructure.html#interfaces-for-url-manipulation">https with non-default port</a><br>
    <a  href="ftp://dev.w3.org:123/html5/spec/infrastructure.html#interfaces-for-url-manipulation">ftp with non-default port</a><br>
    <br>
    <a  href="http://dev.w3.org/html5/spec/infrastructure.html#interfaces-for-url-manipulation">http without port</a><br>
    <a  href="https://dev.w3.org/html5/spec/infrastructure.html#interfaces-for-url-manipulation">https without port</a><br>
    <a  href="ftp://dev.w3.org/html5/spec/infrastructure.html#interfaces-for-url-manipulation">ftp without port</a><br>
    <br>
    <a  href="http://dev.w3.org:0/html5/spec/infrastructure.html#interfaces-for-url-manipulation">http with port 0</a><br>
    ''', treeSanitizer: new NullTreeSanitizer());

  var links =  document.getElementsByTagName('a');
  var n = 10;
  Expect.equals(n, links.length);

  var expected = [
    ['dev.w3.org', 'dev.w3.org'],
    ['dev.w3.org', 'dev.w3.org'],
    ['dev.w3.org', 'dev.w3.org'],
    ['dev.w3.org', 'dev.w3.org:123'],
    ['dev.w3.org', 'dev.w3.org:123'],
    ['dev.w3.org', 'dev.w3.org:123'],
    ['dev.w3.org', 'dev.w3.org'],
    ['dev.w3.org', 'dev.w3.org'],
    ['dev.w3.org', 'dev.w3.org'],
    ['dev.w3.org', 'dev.w3.org:0']
    ];

  for (var i=0; i<n; ++i) {
    var a = links[i];
    Expect.equals(expected[i][0], a.hostname, 'hostname #$i');
    Expect.equals(expected[i][1], a.host, 'host #$i');
  }
}
