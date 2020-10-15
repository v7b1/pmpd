# pmpd
**pmpd** is a collection of objects originally written for [Pure Data](https://puredata.info/) by Cyrille Henry.

The library provides real-time simulations of physical behaviors. **pmpd** can be used to create natural dynamic systems, like a bouncing ball, string movement, Brownian movement, chaos, fluid dynamics, sand, gravitation and more. It can also be used to create displacements thus allowing a completely dynamic approach of pd (max) computing.

With **pmpd** physical dynamics can be modelled without knowing the global equation of the movement. Only the cause of the movement and the involved structure are needed for the simulation. **pmpd** provides the basic objects for this kind of simulation. Assembling them allows the creation of a very large variety of dynamic systems.



Original author: Cyrille Henry 
http://drpichon.free.fr/pmpd/



MaxMSP port by: Volker Böhm 
https://vboehm.net



------



## Building

(Mostly copying from https://github.com/Cycling74/max-devkit ReadMe.md)

0. Clone the code from Github, including submodules: 
   `git clone --recurse-submodules https://github.com/v7b1/pmpd.git`
1. `cd pmpd` to change directories (cd) into the folder
2. `mkdir build` to create a folder with your various build files
3. `cd build` to put yourself into that folder
4. Now you can generate the projects for your chosen build environment:

### Mac 

You can build on the command line using Makefiles (not tested, yet), or you can generate an Xcode project and use the GUI to build.

* Xcode: Run `cmake -G Xcode ..` and then run `cmake --build .` or open the Xcode project from this "build" folder and use the GUI.
* Make: Run `cmake ..` and then run `cmake --build .` or `make`.  Note that the Xcode project is preferrable because it is able to substitute values for e.g. the Info.plist files in your builds.

### Windows

Note: this is untested, but should work something like this:

If you are using Visual Studio, You can run `cmake --help` to get a list of the options available.  Assuming some version of Visual Studio 2017, the commands to generate the projects will look like this:

* 32 bit: `cmake -G "Visual Studio 15 2017" ..`
* 64 bit: `cmake -G "Visual Studio 15 2017 Win64" ..`

Having generated the projects, you can now build by opening the .sln file in the build folder with the Visual Studio app (just double-click the .sln file) or you can build on the command line like this:

`cmake --build . --config Release`