/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that 'Selection' methods throw exceptions with reasonable messages.
 */
import "../../testharness.dart";

void main() {
    shouldThrow((){
            window.getSelection().collapse(document.documentElement, -1);
        }, null
        , "IndexSizeError");

    window.getSelection().empty();
    
    shouldThrow((){
            window.getSelection().collapseToStart();
        }, null
        , "InvalidStateError");
        
    shouldThrow((){
            window.getSelection().collapseToEnd();
        }, null
        ,"InvalidStateError");

    shouldThrow((){
            window.getSelection().setBaseAndExtent(document.documentElement, -1, document.documentElement, 0);
        }, null
        , "IndexSizeError");
        
    shouldThrow((){
            window.getSelection().setBaseAndExtent(document.documentElement, 0, document.documentElement, -1);
        }, null
        , "IndexSizeError");

    shouldThrow((){
            window.getSelection().collapse(document.documentElement, -1);
        }, null
        , "IndexSizeError");

    shouldThrow((){
            window.getSelection().getRangeAt(-1);
        }, null
        , "IndexSizeError");
        
    shouldThrow((){
            window.getSelection().extend(document.documentElement, -1);
        }, null
        , "IndexSizeError");
        
    shouldThrow((){
            window.getSelection().extend(document.documentElement, 1000);
        }, null
        , "IndexSizeError");
    
    checkTestFailures();
}