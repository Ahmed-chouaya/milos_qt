# Development Guide for Milos-QT

## Prerequisites

- NixOS with flakes enabled
- direnv (optional but recommended)

## Quick Start

### 1. Enter Development Shell

```bash
# Using nix develop (requires nix)
nix develop

# Or with direnv (auto-enters shell)
direnv allow
```

This provides Qt6, CMake, Qt Creator, and all build dependencies.

### 2. Build the Project

```bash
# Configure
cmake -B build -DCMAKE_BUILD_TYPE=Debug

# Build
cmake --build build

# Run
./build/milos-qt
```

### 3. Using Qt Creator

Qt Creator is included in the dev shell:

```bash
nix develop
qtcreator
```

Open `CMakeLists.txt` as the project file.

## Build Options

### Debug Build (with debug symbols)
```bash
cmake -B build -DCMAKE_BUILD_TYPE=Debug
```

### Release Build (optimized)
```bash
cmake -B build -DCMAKE_BUILD_TYPE=Release
```

### With Address Sanitizer
```bash
cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_CXX_FLAGS="-fsanitize=address -g"
```

## Directory Structure

```
milos-qt/
├── src/           # C++ backend code
│   ├── main.cpp
│   └── ...
├── qml/           # QML UI code
│   ├── main.qml
│   └── ...
├── nix/           # NixOS integration
├── tests/         # Unit tests
└── build/         # Build output (gitignored)
```

## Development Workflow

1. Make changes to C++ or QML files
2. Rebuild: `cmake --build build`
3. Test: `./build/milos-qt`
4. Repeat

## Running Tests

```bash
ctest --test-dir build
```

## Troubleshooting

### "Qt6 not found"
Ensure you're in the nix develop shell.

### "Wayland platform not available"
Install QtWayland: `nix develop` includes it automatically.

### Build errors
Clean and rebuild:
```bash
rm -rf build
cmake -B build
cmake --build build
```
