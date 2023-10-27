# PSlider plugin

A plugin for Godot 4 to have a slider control that follows a Path2D instead of being
horizontal or vertical (like HSlider or VSlider are)

## Overview

TBD

## Installation

The plugin is written in 100% GDScript so no compilation is required and should work on any
platform. 

To install it from the Godot Asset Library, within your project:
- Select the AssetLib tab
- Search for "Path2D Slider"
- Click Download button
- After the dialog is presented with files, at least include the "addons" directory
- From Project -> Project Settings...
- Go to Plugins tab and enable path2dslider plugin

There are 3 main directories
- addons/path2dslider
- examples/path2dslider

When loading as an asset in another project (as opposed to working on this asset) the following files
should NOT be imported, they will likely conflict with your project
- README.md
- LICENSE
- icon.svg
- icon.svg.import
- project.godot

After using this asset, the examples/path2dslider folder can be removed so as not
to pollute your project.

## Usage

TBD

## Examples

Examples of using the plugin can be found in the "example/path2dslider" directory.  Feel free to
delete this directory for your project.

