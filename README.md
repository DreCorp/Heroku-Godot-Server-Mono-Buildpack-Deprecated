# **Heroku buildpack for Godot Engine Mono Server exports - DEPRECATED**

## :no_entry_sign: This repo is no longer maintained or supported! :no_entry_sign:


[![Maintenance](https://img.shields.io/badge/Maintained%3F-no-red.svg)](https://bitbucket.org/lbesson/ansi-colors)
#

#### [Heroku](https://heroku.com) [buildpack](https://devcenter.heroku.com/articles/buildpacks) for continuous deployment of [Godot Engine](https://godotengine.org) Mono Server exports that utilize Godot's [WebSocketServer](https://docs.godotengine.org/en/stable/classes/class_websocketserver.html#class-websocketserver).
---
## **Features:**
- Allows for [automatic deploys](https://devcenter.heroku.com/articles/github-integration#automatic-deploys) of Godot Mono projects from source to Heroku with Git.
- Runs in the Heroku cloud with [Godot Mono Server executable](https://godotengine.org/download/server).
---
## **Required:**
- Ensure that **`project.godot`** and **`export_presets.cfg`** files are inclided in the source(Godot adds them to `.gitignore` automatically.)
- Project will be exported using [**.Net**](https://dotnet.microsoft.com/en-us/) SDK instead of [**Mono**](https://www.mono-project.com/).
    - In Godot Editor Settings set Mono Build Tool to **`dotnetCLI`**.
---
## **Required Heroku config vars:**
- **GODOT_VERSION** such as **`3.4.4`**.
---
## **Required Godot export template:**
- Exported project needs to be built at least once locally with [Linux/X11 template](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_linux.html?highlight=export%20template).
---
## **Handling of ports:**
- Heroku randomly assigns the port for the application.
- Exported project needs to bind to **`$PORT`** passed as a first argument of **[OS.GetCmdlineArgs()](https://docs.godotengine.org/en/stable/classes/class_os.html?highlight=OS#class-os-method-get-cmdline-args)**:

    ~~~c#
    string[] args = OS.GetCmdlineArgs();
    int port = args[0];

    Godot.Error err = server.Listen(port);
    ~~~
- Connect **websocket** clients to your server with **`wss://your_app.herokuapp.com`**
---
## **Handling of other Heroku config vars:**
- Heroku config vars can be consumed by Godot with **[OS.GetEnvironment()](https://docs.godotengine.org/en/stable/classes/class_os.html?highlight=os#class-os-method-get-environment)**:
    ~~~c#
    string myConfigVar = OS.GetEnvironment("MY_CONFIG_VAR" as string);
    ~~~
---
## **Resources used:**
- [Abdera7mane/godot-server-buildpack](https://github.com/Abdera7mane/godot-server-buildpack)
- [3ddelano/heroku-buildpack-godot](https://github.com/3ddelano/heroku-buildpack-godot)
- [ethiandev/heroku-buildpack-godot](https://github.com/lethiandev/heroku-buildpack-godot)


