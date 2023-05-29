![3DC508FC-12F6-4409-8C47-F0A119C21D99](https://github.com/lunauii/terragear/assets/65362444/fa729f38-9e70-427e-bede-b3584c41c138)
# Terragear

[![Github release](https://img.shields.io/github/v/release/lunauii/terragear?display_name=tag)](https://github.com/lunauii/terragear/releases)
[![License](https://img.shields.io/github/license/lunauii/terragear)](https://github.com/lunauii/terragear/blob/main/LICENSE)
![Most Prelevant Language](https://img.shields.io/github/languages/top/lunauii/terragear?color=orange)

Terragear is an interactive one-size-fits all guide for the video game Terraria.

##### __Table of Contents__
- [Running Terragear](#running-terragear)
- [Feedbacking](#feature-requests-and-bug-reports)
- [Development](#development)
- [FAQ](#terragear-faq)

## Status
Terragear is in heavy development but is mostly stable, except on certain Android devices.

## Running Terragear
**Latest build:**

| [Windows 7+ (x64)](https://github.com/ppy/osu/releases/latest/download) | [Chrome 77+, Edge 79+, Opera 73+, Firefox 75+ (Partial Support)](https://lunaui.itch.io/terragear) |
| ------------- | ------------- |

If your platform is not listed above, you may have to wait for future releases.

## Feature Requests and Bug Reports
*wip*

## Development
To easily develop on Terragear, you need Godot 4.0+ and a system that supports OpenGL 2.0 or higher. Godot can be run on a portable software (Windows, Mac, Linux), or with an app (Android). 
*wip*

## Terragear FAQ:

#### Why isn't it loading for me? All it displays is a black screen/indefinite loading screen.
If you are on an Apple device (iOS, iPad OS, MacOS) this is due to Apple deprecating support for OpenGL 2.0. Currently, Godot 4.0 has no solution for this unlike previous versions due to upstream issues, so you may have to wait a few months until Godot updates to get it to work.
If you are not on Apple, please raise a bug report here: https://github.com/lunauii/terragear/issues

#### The buttons don't work/don't do anything.
This is intentional, as I haven't added functionality yet. Please wait until release-v1.0.0.0 to see full functionality.

#### What was this coded in?
I used Godot 4 and its built in language, GDScript. For deploying online, I used GitHub Pages and itch.io, and exported the tool as a web app.
