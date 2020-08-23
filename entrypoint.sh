#!/bin/bash -l

PATH="$PATH:/root/.elan/bin"
leanproject get-mathlib-cache || true 
leanpkg test