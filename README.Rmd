[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

# presdown

Build an online directory of slides in a way that's friendly to you and continuous integration! You use presdown to generate slides that haven't been generated before or have out of date outputs, incorporating dependencies listed in the DESCRIPTION file and you can even grab the list based on a directory of presentations.

Key functionality is:

- Use generic render to md for multi-output potential
- Put images in the correct directories and have references to them that work
- Refer to a single directory of (generally named) js libraries so that you can manage upgrades to libraries at your discretion
- Optionally, use pandoc to generate (light) html pages

Anticipated functions: 

- `setup_dir()`: Create expected directories
- `catalogue_dependencies()`: Get dependencies and add to a DESCRIPTION
- `install_presentationjs()`: Grab web dependencies (potentially as a git submodule) and install into a `static/[presentationlibname]/` dir plus a corresponding pandoc template for use
- `generate_mdfiles()`: Identify all presentations with modified dates later than their corresponding md versions and generate them
- `generate_htmlfiles()`: Identify all md files with modified dates later than their corresponding html versions and generate them
- `use_build_basic()`: Use our boilerplate build script that installs missing dependencies and renders necessary files
- `use_build_git()`: Use our boilerplate build script that installs missing dependencies and renders necessary files, then commits changes to git using a `[ci skip]` prefix
- `use_travis()`: Use our boilerplate travis script for using travis to generate your markdown files

Anticipated addins:

- New presentation for incorporating metadata etc in setup
- Render process helper

Important considerations: 

- Conforms to (optionally) Hugo/Jekyll expected structures
- Aimed at incremental CI/CD, not full validation
    + Delete and commit the md files to trigger everything, or exclude them from git generally to always do a build
- Expects you to be able to manage your javascript dependencies
- Relies on pandoc template files
