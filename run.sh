#!/bin/bash
find . -iname '*.swift' | xargs swiftc -o build/main && build/main