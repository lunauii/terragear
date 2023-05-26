![3DC508FC-12F6-4409-8C47-F0A119C21D99](https://github.com/lunauii/terragear/assets/65362444/fa729f38-9e70-427e-bede-b3584c41c138)
# Terragear

Terragear is an interactive one-size-fits all guide for the video game Terraria.

Terragear is currently in heavy development, so expect lots of functionality to be missing.

##### __Table of Contents__
- [Installation](#installation)
- [Feedbacking](#feature-requests-and-bug-reports)
- [Development](#development)
- [FAQ](#terragear-faq)

## Installation
Terragear is currently only available as a webapp at https://lunauii.github.io/yaitg or https://lunaui.itch.io/terragear. For Apple devices, you will currently have to manually install it until Godot releases a bug update. Information on how to do so will be released shortly.

## Feature Requests and Bug Reports
*wip*

## Development
To easilly develop on Terragear, you need Godot 4.0+ and a system that supports OpenGL 2.0 or higher. Godot can be run on a portable software (Windows, Mac, Linux), or with an app (Android). To 

## Terragear FAQ:

## Why isn't it loading for me? All it displays is a black screen/indefinite loading screen.
If you are on an Apple device (iOS, iPad OS, MacOS) this is due to Apple deprecating support for OpenGL 2.0. Currently, Godot 4.0 has no solution for this unlike previous versions due to upstream issues, so you may have to wait a few months until Godot updates to get it to work.
If you are not on Apple, please raise a bug report here: https://github.com/lunauii/terragear/issues

## The buttons don't work/don't do anything.
This is intentional, as I haven't added functionality yet. Please wait until release-v1.0.0.0 to see full functionality.

## What was this coded in?
I used Godot 4 and its built in language, GDScript. For deploying online, I used GitHub Pages and itch.io, and exported the tool as a web app.
