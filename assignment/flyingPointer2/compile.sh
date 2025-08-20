#!/bin/bash

# Create dummy header files
chmod +x ../hw_proj/dummyCreator.sh
cd ../hw_proj
./dummyCreator.sh
cd ../flyingPointer2

# Build with cmake
echo "Press 0 for debug mode, others for release mode."
read modeSelected

if [ $modeSelected -eq 0 ]; then
    cmake -DDEBUG_MODE=ON .
else
    cmake -DDEBUG_MODE=OFF .
fi

make

echo "Compiled! The executable program is in 'bin' directory."

