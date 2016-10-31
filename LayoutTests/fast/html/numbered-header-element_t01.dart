/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that any numbered header element end tag can close any 
 * other open numbered header element.
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {

  // Test for WebKit Bug 15136 - HTML5 spec violation: </h1> doesn't end <h3> element in Webkit
  // https://bugs.webkit.org/show_bug.cgi?id=15136
  // rdar://problem/5762882

  DivElement testParent = document.createElement('div') as DivElement;
  testParent.id = 'test0';
  document.body.append(testParent);

  // h1
  
  //debug('&lt;h1> closes &lt;h1>:');
  testParent.innerHtml = '<h1 id="test1"></h1><div id="test2"></div><p>Test that &lt;h1> closes &lt;h1.</p>';
  Element test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h2> closes &lt;h1>:');
  testParent.innerHtml = '<h1 id="test1"></h2><div id="test2"></div><p>Test that &lt;h2> closes &lt;h1.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h3> closes &lt;h1>:');
  testParent.innerHtml = '<h1 id="test1"></h3><div id="test2"></div><p>Test that &lt;h3> closes &lt;h1.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h4> closes &lt;h1>:');
  testParent.innerHtml = '<h1 id="test1"></h4><div id="test2"></div><p>Test that &lt;h4> closes &lt;h1.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h5> closes &lt;h1>:');
  testParent.innerHtml = '<h1 id="test1"></h5><div id="test2"></div><p>Test that &lt;h5> closes &lt;h1.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h6> closes &lt;h1>:');
  testParent.innerHtml = '<h1 id="test1"></h6><div id="test2"></div><p>Test that &lt;h6> closes &lt;h1.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  // h2

  //debug('&lt;h1> closes &lt;h2>:');
  testParent.innerHtml = '<h2 id="test1"></h1><div id="test2"></div><p>Test that &lt;h1> closes &lt;h2.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h2> closes &lt;h2>:');
  testParent.innerHtml = '<h2 id="test1"></h2><div id="test2"></div><p>Test that &lt;h2> closes &lt;h2.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h3> closes &lt;h2>:');
  testParent.innerHtml = '<h2 id="test1"></h3><div id="test2"></div><p>Test that &lt;h3> closes &lt;h2.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h4> closes &lt;h2>:');
  testParent.innerHtml = '<h2 id="test1"></h4><div id="test2"></div><p>Test that &lt;h4> closes &lt;h2.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h5> closes &lt;h2>:');
  testParent.innerHtml = '<h2 id="test1"></h5><div id="test2"></div><p>Test that &lt;h5> closes &lt;h2.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h6> closes &lt;h2>:');
  testParent.innerHtml = '<h2 id="test1"></h6><div id="test2"></div><p>Test that &lt;h6> closes &lt;h2.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  // h3

  //debug('&lt;h1> closes &lt;h3>:');
  testParent.innerHtml = '<h3 id="test1"></h1><div id="test2"></div><p>Test that &lt;h1> closes &lt;h3.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h2> closes &lt;h3>:');
  testParent.innerHtml = '<h3 id="test1"></h2><div id="test2"></div><p>Test that &lt;h2> closes &lt;h3.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h3> closes &lt;h3>:');
  testParent.innerHtml = '<h3 id="test1"></h3><div id="test2"></div><p>Test that &lt;h3> closes &lt;h3.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h4> closes &lt;h3>:');
  testParent.innerHtml = '<h3 id="test1"></h4><div id="test2"></div><p>Test that &lt;h4> closes &lt;h3.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h5> closes &lt;h3>:');
  testParent.innerHtml = '<h3 id="test1"></h5><div id="test2"></div><p>Test that &lt;h5> closes &lt;h3.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h6> closes &lt;h3>:');
  testParent.innerHtml = '<h3 id="test1"></h6><div id="test2"></div><p>Test that &lt;h6> closes &lt;h3.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  // h4

  //debug('&lt;h1> closes &lt;h4>:');
  testParent.innerHtml = '<h4 id="test1"></h1><div id="test2"></div><p>Test that &lt;h1> closes &lt;h4.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h2> closes &lt;h4>:');
  testParent.innerHtml = '<h4 id="test1"></h2><div id="test2"></div><p>Test that &lt;h2> closes &lt;h4.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h3> closes &lt;h4>:');
  testParent.innerHtml = '<h4 id="test1"></h3><div id="test2"></div><p>Test that &lt;h3> closes &lt;h4.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h4> closes &lt;h4>:');
  testParent.innerHtml = '<h4 id="test1"></h4><div id="test2"></div><p>Test that &lt;h4> closes &lt;h4.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h5> closes &lt;h4>:');
  testParent.innerHtml = '<h4 id="test1"></h5><div id="test2"></div><p>Test that &lt;h5> closes &lt;h4.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h6> closes &lt;h4>:');
  testParent.innerHtml = '<h4 id="test1"></h6><div id="test2"></div><p>Test that &lt;h6> closes &lt;h4.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  // h5

  //debug('&lt;h1> closes &lt;h5>:');
  testParent.innerHtml = '<h5 id="test1"></h1><div id="test2"></div><p>Test that &lt;h1> closes &lt;h5.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h2> closes &lt;h5>:');
  testParent.innerHtml = '<h5 id="test1"></h2><div id="test2"></div><p>Test that &lt;h2> closes &lt;h5.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h3> closes &lt;h5>:');
  testParent.innerHtml = '<h5 id="test1"></h3><div id="test2"></div><p>Test that &lt;h3> closes &lt;h5.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h4> closes &lt;h5>:');
  testParent.innerHtml = '<h5 id="test1"></h4><div id="test2"></div><p>Test that &lt;h4> closes &lt;h5.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h5> closes &lt;h5>:');
  testParent.innerHtml = '<h5 id="test1"></h5><div id="test2"></div><p>Test that &lt;h5> closes &lt;h5.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h6> closes &lt;h5>:');
  testParent.innerHtml = '<h5 id="test1"></h6><div id="test2"></div><p>Test that &lt;h6> closes &lt;h5.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  // h6

  //debug('&lt;h1> closes &lt;h6>:');
  testParent.innerHtml = '<h6 id="test1"></h1><div id="test2"></div><p>Test that &lt;h1> closes &lt;h6.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h2> closes &lt;h6>:');
  testParent.innerHtml = '<h6 id="test1"></h2><div id="test2"></div><p>Test that &lt;h2> closes &lt;h6.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h3> closes &lt;h6>:');
  testParent.innerHtml = '<h6 id="test1"></h3><div id="test2"></div><p>Test that &lt;h3> closes &lt;h6.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h4> closes &lt;h6>:');
  testParent.innerHtml = '<h6 id="test1"></h4><div id="test2"></div><p>Test that &lt;h4> closes &lt;h6.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h5> closes &lt;h6>:');
  testParent.innerHtml = '<h6 id="test1"></h5><div id="test2"></div><p>Test that &lt;h5> closes &lt;h6.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  //debug('&lt;h6> closes &lt;h6>:');
  testParent.innerHtml = '<h6 id="test1"></h6><div id="test2"></div><p>Test that &lt;h6> closes &lt;h6.</p>';
  test2 = document.getElementById('test2');
  Expect.isFalse((test2.parentNode as Element).id == "test1");
  Expect.isTrue((test2.parentNode as Element).id == "test0");

  testParent.remove();
}
