/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

void main() {
    description(
    "This tests that negative scrollTop and scrollLeft values are clamped to zero."
    );
    
    var scroller = document.createElement('div');
    scroller.id = 'scroller';
    scroller.style.overflow = 'scroll';
    scroller.style.width = '200px';
    scroller.style.height = '200px';
    
    var contents = document.createElement('div');
    contents.style.width = '400px';
    contents.style.height = '400px';
    
    scroller.append(contents);
    document.body.append(scroller);
    
    String attemptScroll(x, y) {
      scroller.scrollTop = x;
      scroller.scrollLeft = y;
      return "${scroller.scrollTop},${scroller.scrollLeft}";
    }
    
    shouldBe(attemptScroll(0, 0), '0,0');
    shouldBe(attemptScroll(50, 50), '50,50');
    shouldBe(attemptScroll(-50, -50), '0,0');
    
    checkTestFailures();
}
