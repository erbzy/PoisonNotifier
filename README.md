# Poison Resistance Notifier

A local RuneLite plugin that alerts you when your player’s poison/venom protection expires and reminds you to drink another dose.

## Compatibility

- RuneLite client/API dependency pinned to **1.13.2** in `build.gradle`.
- Java source compatibility: **Java 11**.
- No external libraries are needed beyond RuneLite’s published dependencies.

## What it does

- Reads RuneLite’s player `POISON` status variable every game tick.
- Treats a negative status value as active poison or venom protection.
- Sends an alert only after protection was observed active and then expires.
- Supports a RuneLite desktop notification and/or an in-game chat reminder (both enabled by default).
- Does not drink potions or interact with inventory items.

## Build on Windows

1. Extract this ZIP to a normal writable folder.
2. Install **JDK 11 or newer** and make sure `java -version` works in PowerShell.
3. Double-click `build.bat` to compile and build the project. The development launcher is intentionally named `PoisonResistanceNotifierLauncher.java` (not `*Test.java`) so Gradle does not mistake it for a test class and fail when it discovers no JUnit tests.
4. Double-click `run.bat` to launch a separate RuneLite development client with the plugin loaded. This is the recommended way to test the plugin locally.

To create the bundled development launcher JAR, open PowerShell in this folder and run:

```powershell
.\tools\gradle-bootstrap.bat shadowJar
```

It will be created at:

`build\libs\poison-resistance-notifier-1.0.0-all.jar`

That `-all.jar` is a **self-contained development launcher**, not a drop-in plugin JAR for the regular RuneLite plugins folder. RuneLite does not install arbitrary local plugin JARs simply by copying them into a folder. For local testing, use `run.bat`; for use in your everyday client, the plugin needs to be installed through a supported plugin-loading route (such as Plugin Hub once published/approved).

If you already have a Gradle wrapper in the folder, the equivalent commands are:

```powershell
.\gradlew.bat clean build
.\gradlew.bat run
.\gradlew.bat shadowJar
```

The development `run` task launches a separate RuneLite client. It does not automatically inject the plugin into your regular RuneLite installation.

## Configuration

In RuneLite’s plugin configuration, find **Poison Resistance Notifier** and choose:

- **Desktop notification** — RuneLite notification controls (desktop tray, sound, flash, etc.) when protection expires; enabled by default.
- **Chat message** — in-game chat reminder when protection expires.

## Detection details

RuneLite’s `VarPlayer.POISON` value uses negative values for immunity. Venom immunity transitions into poison immunity while the value remains negative, so the plugin waits until the value reaches zero before warning. If the plugin is enabled only after protection has already expired, it deliberately does not show a retroactive warning.

## Troubleshooting

- If Gradle downloads fail, check internet access or open the project in IntelliJ and refresh Gradle dependencies.
- If the dependency for RuneLite `1.13.2` cannot be resolved, check that the requested RuneLite version is available from the RuneLite Maven repository. The version is pinned deliberately; edit `runeLiteVersion` in `build.gradle` only if you want to target a different release.
