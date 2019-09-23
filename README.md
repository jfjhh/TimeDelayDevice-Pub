Time Delay Device Documentation
===============================

See `./doc/doc-all.pdf`. It's header is reproduced below.


All of the documentation concerning the auxilliary files for the project
is assembled here. What follows is a description of the contents of each
directory.

-   `adjustable-delay`: Schematics and ideas for implementing adjustable
    delay in the circuit. The subdirectory `Linear` contains a tenative
    schematic (KiCAD files and <span
    style="font-variant:small-caps;">pdf</span>) of a circuit that
    implements the different clock frequencies by counting, while
    `Arbitrary` gives what I have so far in creating an arbitrary delay
    circuit.

-   `arduino`: The code uploaded to the Arduino Due.

-   `characterization`: Contains many different parts of the code used
    to analyze the characterization data for the device, and includes
    instructions on how to program the history.

-   `doc`: The top-level documentation directory (this one).

-   `fifo-p3f`: The KiCAD files for the device, as well as a schematic
    <span style="font-variant:small-caps;">pdf</span> and the gerber
    files that I sent for manufacture.

-   `figures`: The images and GNUPlot code used to create the figures
    for the paper.[^1]

-   `program-rescaling`: The code used to calculate the gain and offset
    resistor values to be optimal, given the constraints of E-series
    values and the overall resistances needed.

-   `triangle`: The code used to generate the spumpus (initial history
    signal) for the triangle-<span
    style="font-variant:small-caps;">dde</span> (relay-control) circuit
    in the paper. This is a good starting point if you want to program
    something different.

[^1]: *Spumpus* stands for spiky lumpus, where *lumpus* refers to a
    lumpy-looking signal. We want a strange signal for the programming
    to demonstrate that it is really *arbitrary*.

