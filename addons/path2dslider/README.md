# Path2DSlider plugin

A plugin for Godot 4 to have a slider control that follows a Path2D instead of 
being horizontal or vertical (like HSlider or VSlider are)

## Usage

This plugin works by using a Path2D child of the Path2DSlider control to define
the path from beginning to end.  The value is expressed in the property
"progress_ratio".  It always goes from 0 to 1.  To present the "thumb" (the
graphic used to click on and drag the value from beginning to end) another
control (of any type) must be attached as another child of the Path2DSlider
control.  

Note that the position of the "thumb" control will be based on the pivot_offset
specified, so that the rotation point and the point along the path will match.

The plugin will always choose the last control as the one to use as the "thumb"
but it doesn't make much sense to have more than the Path2D and "thumb" control
as children of the Path2DSlider. 

A typical use case is to put the slider on top of a backdrop using something
like TextureRect that would look like the "trough" that the slider would go
along.  Both examples in the examples directory use that technique.

Once those two children have been added you can change the "progress_ratio"
property in the Inspector and it will change in the editor.  When the scene is
running, clicking on the "thumb" control will allow the "thumb" to be moved
from the beginning to the end.

There is a signal emitted when the "progress_ratio" changes so that the
application can react to changes.


## Installation

The plugin is written in 100% GDScript so no compilation is required and should
work on any platform. 

To install it from the Godot Asset Library, within your project:
- Select the AssetLib tab
- Search for "Path2D Slider"
- Click Download button
- After the dialog is presented with files, include the "addons" directory, you
  may also include the files in the "example" and "source" directories but they
  are optional.  Do not include the top level files since they would likely
  conflict with your project.
- Go to Project -> Project Settings...
- Select Plugins tab and enable path2dslider plugin

There are three main directories
- addons/path2dslider
- examples/path2dslider
- source/path2dslider

When loading as an asset in another project (as opposed to working on this
asset) the following files should NOT be imported, they will likely conflict
with your project
- README.md
- LICENSE
- icon.svg
- icon.svg.import
- project.godot

After using this asset, the examples/path2dslider and source/path2dslider
folder can be removed so as not to pollute your project.

## Examples

Examples of using the plugin can be found in the "example/path2dslider"
directory.  Feel free to delete this directory for your project.

