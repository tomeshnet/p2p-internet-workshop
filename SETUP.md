# Setup Instructions

To participate in the workshop, you will need access to the software described below. In addition, you will need an up-to-date web browser.

## The Bash Shell

Bash is a commonly-used shell that gives you the power to do simple
tasks more quickly.

### Windows

<a href="https://www.youtube.com/watch?v=339AEqk9c-8">Video Tutorial</a>

1. Download the Git for Windows <a href="https://git-for-windows.github.io/">installer</a>.
2. Run the installer and follow the steps bellow:
  - Click on "Next".
  - Click on "Next".
  - **Keep "Use Git from the Windows Command Prompt" selected and click on 
  "Next".**
    If you forgot to do this programs that you need for the workshop will not 
    work properly.
    If this happens rerun the installer and select the appropriate option.
  - Click on "Next".
  - **Keep "Checkout Windows-style, commit Unix-style line endings" selected and 
  click on "Next".**
  - ** Keep "Use Windows' default console window" selected and click on "Next".**
  - Click on "Install".
  - Click on "Finish".
3. If your "HOME" environment variable is not set (or you don't know what this is):
  - Open command prompt (Open Start Menu then type <code>cmd</code> and press [Enter])</li>
  - Type the following line into the command prompt window exactly as shown:
    `setx HOME "%USERPROFILE%"`
  - Press [Enter], you should see `SUCCESS: Specified value was saved.`
  - Quit command prompt by typing `exit` then pressing [Enter]

This will provide you with Bash in the Git Bash program.

### macOS

The default shell in all versions of macOS is Bash, so no need to install 
anything. You access Bash from the Terminal (found in `/Applications/Utilities`).
See the Git installation <a href="https://www.youtube.com/watch?v=9LQhwETCdwY ">
video tutorial</a> for an example on how to open the Terminal. You may want to 
keep Terminal in your dock for this workshop.

### Linux

The default shell is usually Bash, but if your machine is set up differently you 
can run it by opening a terminal and typing `bash`. There is no need to install 
anything.

## Text Editor

When you're writing code, it's nice to have a text editor that is optimized for 
writing code, with features like automatic color-coding of key words.  The 
default text editor on macOS and Linux is usually set to Vim, which is not 
famous for being intuitive. if you accidentally find yourself stuck in it, try 
typing the escape key, followed by `:q!` (colon, lower-case 'q', exclamation 
mark), then hitting Return to return to the shell.

### Windows

<a href="https://www.youtube.com/watch?v=339AEqk9c-8">Video Tutorial</a>

nano is a basic editor and the default that instructors use in the workshop.
To install it, download the <a href="https://github.com/swcarpentry/windows-installer/releases/download/v0.3/SWCarpentryInstaller.exe">
Software Carpentry Windows installer</a> and double click on the file to run it.
This installer requires an active internet connection.

Others editors that you can use are:

- <a href="http://notepad-plus-plus.org/">Notepad++</a> or
- <a href="http://www.sublimetext.com/">Sublime Text</a>.

**Be aware that you must add its installation directory to your system path.**
Please ask your instructor to help you do this.

### macOS

nano is a basic editor and the default that instructors use in the workshop.
See the Software Carpentry Git installation 
<a href="https://www.youtube.com/watch?v=9LQhwETCdwY ">video tutorial</a>
for an example on how to open nano. It should be pre-installed.

Others editors that you can use are:

- <a href="http://www.barebones.com/products/textwrangler/">Text Wrangler</a> or
- <a href="http://www.sublimetext.com/">Sublime Text</a>.

### Linux

nano is a basic editor and the default that instructors use in the workshop. It 
should be pre-installed.

Others editors that you can use are:

- <a href="https://wiki.gnome.org/Apps/Gedit">Gedit</a>,
- <a href="http://kate-editor.org/">Kate</a> or
- <a href="http://www.sublimetext.com/">Sublime Text</a>.

_These instructions were adapted from [Software Carpentry Material](https://github.com/swcarpentry/workshop-template)_
