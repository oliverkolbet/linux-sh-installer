#! /bin/bash

test() {
echo "This is a test."
echo "$(whoami) typed 'test'." >> ~/.example/log.txt
}

echo "Example ready. Type \"test\" for a test."
