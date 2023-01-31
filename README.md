# csgtostep

This is a "small" tool to convert a [CSG file (".csg")](https://en.wikipedia.org/wiki/Constructive_solid_geometry) to a [STEP file (".step")](https://en.wikipedia.org/wiki/ISO_10303-21). It uses a [docker image of FreeCAD](https://hub.docker.com/r/amrit3701/freecad-cli) to use [FreeCAD](https://www.freecadweb.org) to make the conversion, therefore the tool has a decent footprint (~4GB).

Use the `csgtostep.sh` script to convert a CSG file.
