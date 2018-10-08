/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests the behaviour of a number of the DOM Canvas drawing
 * methods when given 0, Infinity, or NaN as parameters.
 */
import "dart:html";
import "../../testcommon.dart";

var NaN = double.nan;
var Infinity = double.infinity;
var NegInfinity = double.negativeInfinity;

pass(msg) => testPassed('pass: $msg');
fail(msg) => testFailed(msg);

main() {
  document.body.setInnerHtml('''
      <canvas id="test" width="100" height="100"></canvas><br />
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  dynamic canvas = document.getElementById("test");
  var context = canvas.getContext("2d");
  context.fillStyle = '#f00';
  context.fillRect(0, 0, canvas.width, canvas.height);
  try {
    context.fillRect(0, 0, 0, 0);
    pass("called fillRect 0*0 fillRect without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " with 0*0 fillRect");       
  }
  try {
    context.fillRect(0, 0, 0.0/1.0, 0.0/1.0);
    pass("called fillRect with Infinity*Infinity fillRect without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " with Infinity*Infinity fillRect");       
  }
  try {
    context.fillRect(0, 0, NaN, NaN);
    pass("did not throw exception with NaN*NaN fillRect.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on NaN*NaN fillRect.");       
  }
  try {
    context.clearRect(0, 0, 0, 0);
    pass("called clearRect 0*0 clearRect without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " with 0*0 clearRect.");       
  }
  try {
    context.clearRect(0, 0, 0.0/1.0, 0.0/1.0);
    pass("called clearRect with Infinity*Infinity clearRect without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " with Infinity*Infinity clearRect.");       
  }
  try {
    context.clearRect(0, 0, NaN, NaN);
    pass("did not throw exception with NaN*NaN clearRect.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on NaN*NaN clearRect.");       
  }
  try {
    context.rect(0, 0, 0, 0);
    pass("called rect 0*0 rect without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " with 0*0 rect.");       
  }
  try {
    context.rect(0, 0, 0.0/1.0, 0.0/1.0);
    pass("called rect with Infinity*Infinity rect without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " with Infinity*Infinity rect.");       
  }
  try {
    context.rect(0, 0, NaN, NaN);
    pass("did not throw exception with NaN*NaN rect.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on NaN*NaN rect.");       
  }
  try {
    context.fill();
    pass("called fill with an empty path without throwing an exception.");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on fill with no path.");       
  }
  try {
    context.arc(2, 2, 0, 0, 90, true);
    pass("did not throw exception on arc with zero-length radius");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on arc with zero-length radius");    
  }
  try {
    context.arc(2, 2, -10, 0, 90, true);
    fail("did not throw exception on arc with negative-length radius");
  } catch (e) {
    pass("threw exception code " + e.toString() + " on arc with negative-length radius");    
  }
  try {
    context.arc(2, 2, Infinity, 0, 90, true);
    pass("did not throw exception on arc with infinite radius");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on arc with infinite radius");    
  }
  try {
    context.arc(2, 2, NaN, 0, 90, true);
    pass("did not throw exception on arc with NaN-length radius");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on arc with NaN-length radius");    
  }
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.arcTo(2, 2, 4, 4, 0);
    pass("did not throw exception on arcTo with zero-length radius");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on arcTo with zero-length radius");    
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.arcTo(2, 2, 4, 4, -10);
    fail("did not throw exception on arcTo with negative-length radius");
  } catch (e) {
    pass("threw exception code " + e.toString() + " on arcTo with negative-length radius");    
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.arcTo(2, 2, 4, 4, Infinity);
    pass("did not throw exception on arcTo with infinite radius");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on arcTo with infinite radius");    
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.arcTo(2, 2, 4, 4, NaN);
    pass("did not throw exception on arcTo with NaN-length radius");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on arcTo with NaN-length radius");    
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.lineTo(Infinity, Infinity);
    pass("did not throw exception on lineTo(Infinity, Infinity).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on lineTo(Infinity, Infinity).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.lineTo(Infinity, 20);
    pass("did not throw exception on lineTo(Infinity, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on lineTo(Infinity, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.lineTo(20, Infinity);
    pass("did not throw exception on lineTo(20, Infinity).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on lineTo(20, Infinity).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.lineTo(NaN, NaN);
    pass("did not throw exception on lineTo(NaN, NaN).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on lineTo(NaN, NaN).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.lineTo(20, NaN);
    pass("did not throw exception on lineTo(20, NaN).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on lineTo(20, NaN).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.lineTo(NaN, 20);
    pass("did not throw exception on lineTo(NaN, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on lineTo(NaN, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, 20, Infinity, Infinity);
    pass("did not throw exception on quadraticCurveTo(20, 20, Infinity, Infinity).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, 20, Infinity, Infinity).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(Infinity, Infinity, 20, 20);
    pass("did not throw exception on quadraticCurveTo(Infinity, Infinity, 20, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(Infinity, Infinity, 20, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(Infinity, 20, 20, 20);
    pass("did not throw exception on quadraticCurveTo(Infinity, 20, 20, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(Infinity, 20, 20, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, Infinity, 20, 20);
    pass("did not throw exception on quadraticCurveTo(20, Infinity, 20, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, Infinity, 20, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, 20, Infinity, 20);
    pass("did not throw exception on quadraticCurveTo(20, 20, Infinity, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, 20, Infinity, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, 20, 20, Infinity);
    pass("did not throw exception on quadraticCurveTo(20, 20, 20, Infinity).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, 20, 20, Infinity).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, 20, NaN, NaN);
    pass("did not throw exception on quadraticCurveTo(20, 20, NaN, NaN).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, 20, NaN, NaN).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(NaN, NaN, 20, 20);
    pass("did not throw exception on quadraticCurveTo(NaN, NaN, 20, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(NaN, NaN, 20, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(NaN, 20, 20, 20);
    pass("did not throw exception on quadraticCurveTo(NaN, 20, 20, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(NaN, 20, 20, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, NaN, 20, 20);
    pass("did not throw exception on quadraticCurveTo(20, NaN, 20, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, NaN, 20, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, 20, NaN, 20);
    pass("did not throw exception on quadraticCurveTo(20, 20, Nan, 20).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, 20, NaN, 20).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.quadraticCurveTo(20, 20, 20, NaN);
    pass("did not throw exception on quadraticCurveTo(20, 20, 20, NaN).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on quadraticCurveTo(20, 20, 20, NaN).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, 30, Infinity, Infinity);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, 30, Infinity, Infinity).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, 30, Infinity, Infinity).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, 30, 30, Infinity);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, 30, 30, Infinity).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, 30, 30, Infinity).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, 30, Infinity, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, 30, Infinity, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, 30, Infinity, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, Infinity, Infinity, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, Infinity, Infinity, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, Infinity, Infinity, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, Infinity, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, Infinity, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, Infinity, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, Infinity, 30, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, Infinity, 30, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, Infinity, 30, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(Infinity, Infinity, 20, 20, 30, 30);
    pass("did not throw exception on bezierCurveTo(Infinity, Infinity, 20, 20, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(Infinity, Infinity, 20, 20, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(30, Infinity, 20, 20, 30, 30);
    pass("did not throw exception on bezierCurveTo(30, Infinity, 20, 20, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(30, Infinity, 20, 20, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(Infinity, 30, 20, 20, 30, 30);
    pass("did not throw exception on bezierCurveTo(Infinity, 30, 20, 20, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(Infinity, 30, 20, 20, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, 30, NaN, NaN);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, 30, NaN, NaN).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, 30, NaN, NaN).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, 30, 0, NaN);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, 30, 0, NaN).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, 30, 0, NaN).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, 30, NaN, 0);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, 30, NaN, 0).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, 30, NaN, 0).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, NaN, NaN, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, NaN, NaN, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, NaN, NaN, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, 30, NaN, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, 30, NaN, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, 30, NaN, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, 20, NaN, 30, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, 20, NaN, 30, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, 20, NaN, 30, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(NaN, NaN, 20, 20, 30, 30);
    pass("did not throw exception on bezierCurveTo(NaN, NaN, 20, 20, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(NaN, NaN, 20, 20, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(20, NaN, 20, 20, 30, 30);
    pass("did not throw exception on bezierCurveTo(20, NaN, 20, 20, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(20, NaN, 20, 20, 30, 30).");       
  }
  context.closePath();
  context.beginPath();
  try {
    context.moveTo(10, 10);
    context.bezierCurveTo(NaN, 20, 20, 20, 30, 30);
    pass("did not throw exception on bezierCurveTo(NaN, 20, 20, 20, 30, 30).");
  } catch (e) {
    fail("threw exception code " + e.toString() + " on bezierCurveTo(NaN, 20, 20, 20, 30, 30).");       
  }
  context.closePath();

  dynamic canvas2 = document.createElement('canvas');
  canvas2.width = 0;
  canvas2.height = 0;
  try {
    var pattern = canvas2.getContext('2d').createPattern(canvas2, 'repeat');
    fail("did not throw exception on createPattern with 0x0 canvas.");
  } catch (e) {
    pass("threw exception code " + e.toString() + " on createPattern with 0x0 canvas.");
  }
}
