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
import "dart:math" as Math;
import "../../../testharness.dart";
import "../resources/subpixel-utils.dart" as SubPixelLayout;

const String htmlEL1 = r'''
<style>
#container {
    font: 10px/1 Ahem, sans-serif;
    width: 200px;
    height: 200px;
    border: 1px solid black;
    -webkit-writing-mode: vertical-lr;
    text-align: right;
}

#rounded-rect {
    float: right;
    -webkit-writing-mode: horizontal-tb;
    width: 100px;
    height: 100px;
    background-color: blue;
    border-radius: 20px 30px 40px 50px / 50px 40px 30px 20px;
    shape-outside: inset(0px round 20px 30px 40px 50px / 50px 40px 30px 20px);
}
</style>
''';

const String htmlEL2 = r'''
<p>The block squares should wrap around the top of the blue shape. They should not overlap the shape.</p>
<div id="container">
<span id="s1">X</span><br/>
    <div id="rounded-rect"></div>
<span id="s2">X</span><br/>
<span id="s3">X</span><br/>
<span id="s4">X</span><br/>
<span id="s5">X</span><br/>
<span id="s6">X</span><br/>
<span id="s7">X</span><br/>
<span id="s8">X</span><br/>
<span id="s9">X</span><br/>
<span id="s10">X</span><br/>
<span id="s11">X</span><br/>
<span id="s12">X</span>
</div>
''';

Rectangle elementRect(elementId) {
    Rectangle s = document.getElementById("container").getBoundingClientRect();
    Rectangle r = document.getElementById(elementId).getBoundingClientRect();
    return new Rectangle(r.left - s.left, r.top - s.top, r.width, r.height);
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    
    test(() {
        var rect = elementRect("s1");
        assert_equals(rect.left, 1);
        assert_equals(rect.top, 191);
    }, "1st square doesn't overlap shape.");
    
    test(() {
        var rect = elementRect("s2");
        assert_equals(rect.left, 11);
        assert_approx_equals(rect.top, 97, 0.5);
    }, "2nd square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s3");
        assert_equals(rect.left, 21);
        assert_approx_equals(rect.top, 91, 0.5);
    }, "3rd square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s4");
        assert_equals(rect.left, 31);
        assert_approx_equals(rect.top, 91, 0.5);
    }, "4th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s5");
        assert_equals(rect.left, 41);
        assert_approx_equals(rect.top, 91, 0.5);
    }, "5th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s6");
        assert_equals(rect.left, 51);
        assert_approx_equals(rect.top, 91, 0.5);
    }, "6th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s7");
        assert_equals(rect.left, 61);
        assert_approx_equals(rect.top, 91, 0.5);
    }, "7th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s8");
        assert_equals(rect.left, 71);
        assert_approx_equals(rect.top, 91, 0.5);
    }, "8th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s9");
        assert_equals(rect.left, 81);
        assert_approx_equals(rect.top, 92, 0.5);
    }, "9th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s10");
        assert_equals(rect.left, 91);
        assert_approx_equals(rect.top, 95, 0.5);
    }, "10th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s11");
        assert_equals(rect.left, 101);
        assert_approx_equals(rect.top, 99, 0.5);
    }, "11th square is properly affected by shape.");
    
    test(() {
        var rect = elementRect("s12");
        assert_equals(rect.left, 111);
        assert_equals(rect.top, 191);
    }, "12th square doesn't overlap shape.");

    checkTestFailures();
}
